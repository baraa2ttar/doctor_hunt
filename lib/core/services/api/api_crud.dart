import 'package:adv/core/services/api/status_class.dart';
import 'package:adv/core/services/connectivity/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:convert';


class Crud {
  Future<Either<Status_Classes, Map>> postData(
      String link, Map body, Map<String, String> headers) async {
    try {
      if (await Check_Internet()) {
        var responce = await http.post(Uri.parse(link),
            body: jsonEncode(body), headers: headers);
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          Map reponce_body = jsonDecode(responce.body);
          print(reponce_body);
          return Right(reponce_body);
        } else {
          return Left(Status_Classes.Server_Error);
        }
      } else {
        return left(Status_Classes.Offline_Error);
      }
    } catch (e) {
      return Left(Status_Classes.Server_Error);
    }
  }


}
