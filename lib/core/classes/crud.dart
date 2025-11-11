import 'package:adv/core/classes/status_class.dart';
import 'package:adv/core/classes/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:convert';

class Crud {

  // GET
  Future<Either<Status_Classes, dynamic>> getDataDaynamic(
      String link,
      Map<String, String> headers,
      ) async {
    try {
      print('🔍 getDataDaynamic called with URL: $link');
      print('🔍 Headers: $headers');
      
      if (await Check_Internet()) {
        print('🌐 Internet connection available');
        var response = await http.get(Uri.parse(link), headers: headers);
        
        print('📡 Response status code: ${response.statusCode}');
        print('📡 Response body: ${response.body}');
        
        if (response.statusCode == 200) {
          try {
            var responseBody = jsonDecode(response.body);
            print('✅ Successfully parsed response: $responseBody');
            print('📊 Response type: ${responseBody.runtimeType}');
            return Right(responseBody);
          } catch (parseError) {
            print('❌ JSON parse error: $parseError');
            print('📄 Raw response body: ${response.body}');
            return Left(Status_Classes.Server_Error);
          }
        } else {
          print('❌ Server error: ${response.statusCode}');
          print('📄 Error response body: ${response.body}');
          return Left(Status_Classes.Server_Error);
        }
      } else {
        print('📡 No internet connection');
        return Left(Status_Classes.Offline_Error);
      }
    } catch (e) {
      print('💥 Exception in getDataDaynamic: $e');
      return Left(Status_Classes.Server_Error);
    }
  }


  // POST
  Future<Either<Status_Classes, dynamic>> postDataDynamic(
      String link,
      Map body,
      Map<String, String> headers,
      ) async {
    try {
      if (await Check_Internet()) {
        print('Making POST request to: $link');
        print('Request body: ${jsonEncode(body)}');
        print('Request headers: $headers');

        var response = await http.post(
          Uri.parse(link),
          body: jsonEncode(body),
          headers: headers,
        );

        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Handle empty response body (common with Prefer: return=minimal)
          if (response.body.isEmpty) {
            print('Success with empty response body');
            return Right({'success': true, 'status': response.statusCode});
          }

          var responseBody = jsonDecode(response.body);
          print('Parsed response: $responseBody');
          return Right(responseBody);
        } else {
          print('Server error: ${response.statusCode} - ${response.body}');
          return Left(Status_Classes.Server_Error);
        }
      } else {
        print('No internet connection');
        return Left(Status_Classes.Offline_Error);
      }
    } catch (e) {
      print('Exception in postData: $e');
      return Left(Status_Classes.Server_Error);
    }
  }

// put 
  Future<Either<Status_Classes, Map>> putData(
      String link, Map body, Map<String, String> headers) async {
    try {
      if (await Check_Internet()) {
        var response = await http.put(Uri.parse(link),
            body: jsonEncode(body), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 204) {
          Map responseBody = jsonDecode(response.body.isNotEmpty ? response.body : '{}');
          print(responseBody);
          return Right(responseBody);
        } else {
          return Left(Status_Classes.Server_Error);
        }
      } else {
        return Left(Status_Classes.Offline_Error);
      }
    } catch (e) {
      return Left(Status_Classes.Server_Error);
    }
  }

// delete
  Future<Either<Status_Classes, Map>> deleteData(
      String link, Map<String, String> headers) async {
    try {
      if (await Check_Internet()) {
        var response = await http.delete(Uri.parse(link), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 204) {
          Map responseBody = response.body.isNotEmpty
              ? jsonDecode(response.body)
              : {};
          print(responseBody);
          return Right(responseBody);
        } else {
          return Left(Status_Classes.Server_Error);
        }
      } else {
        return Left(Status_Classes.Offline_Error);
      }
    } catch (e) {
      return Left(Status_Classes.Server_Error);
    }
  }


  Future<Either<Status_Classes, Map>> postFormData(
  String url,
  Map<String, String> body,
  Map<String, String> headers,
) async {
  try {
    if (await Check_Internet()) {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      body.forEach((key, value) {
        request.fields[key] = value;
      });

      var streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print("Response body: $responseBody");
        return Right(responseBody);
      } else {
        print("Error response: ${response.statusCode} - ${response.body}");
        return Left(Status_Classes.Server_Error);
      }
    } else {
      return Left(Status_Classes.Offline_Error);
    }
  } catch (e) {
    print("Exception in postFormData: $e");
    return Left(Status_Classes.Server_Error);
  }
  }





  
}
