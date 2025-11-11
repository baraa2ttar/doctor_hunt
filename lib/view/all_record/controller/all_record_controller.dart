import '../../../core/classes/crud.dart';
import '../../../core/constant/app_keys.dart';
import '../../../core/exports/ui_exports.dart';
import 'package:adv/models/record_model.dart';

import '../../../core/exports/main_exports.dart';
import '../../../core/services/app_link.dart';


// class AllRecordController extends GetxController {
//   var records = <Record>[
//     Record(date: '27 FEB', name: 'Abdullah Mamun', prescriptions: '1 Prescription'),
//     Record(date: '28 FEB', name: 'Abdullah Shuvo', prescriptions: '1 Prescription'),
//     Record(date: '01 MAR', name: 'Shruti Kedia', prescriptions: '1 Prescription'),
//   ].obs; // Observable list of records
// }

class AllRecordController extends GetxController {
  var records = <Record>[].obs; // Observable list of records
  final Crud crud = Crud();
  // int _nextId = 1; // Start from 1 and increment properly
  // String Bearer =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im55cG5hc3F2cG1qem5xcmJ3aHpsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMxNzgzNzcsImV4cCI6MjA2ODc1NDM3N30.OKubjY4wG4LzEXwsK6-4Ah33CdnqlLTEp5vP4CRrhHk";
  String ApiKey = AppKeys.apiKey;
      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im55cG5hc3F2cG1qem5xcmJ3aHpsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMxNzgzNzcsImV4cCI6MjA2ODc1NDM3N30.OKubjY4wG4LzEXwsK6-4Ah33CdnqlLTEp5vP4CRrhHk";
  void onInit() {
    super.onInit();
    fetchRecords();
    // Call fetchRecords when the controller is initialized
  }

  var selectedIndex = (-1).obs;
  TextEditingController namecontroller = TextEditingController();

  // Method to update the selected index
  void selectButton(int index) {
    selectedIndex.value = index;
  }

  // Generate a unique ID using timestamp
  int _generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  // Format date for Supabase
  String _formatDateForSupabase(String date) {
    try {
      // If date is already in ISO format, return as is
      if (date.contains('T') && date.contains('Z')) {
        return date;
      }
      // Otherwise, try to parse and format
      DateTime parsedDate = DateTime.parse(date);
      return parsedDate.toUtc().toIso8601String();
    } catch (e) {
      // If parsing fails, use current date
      print('Date parsing error: $e, using current date');
      return DateTime.now().toUtc().toIso8601String();
    }
  }

  // List of SVG paths
  final List<String> svgPaths = [
    'assets/svgs/report.svg',
    'assets/svgs/prescription.svg',
    'assets/svgs/invoice.svg',
  ];

  // List of text labels corresponding to SVGs
  final List<String> textPaths = [
    'Report',
    'Prescription',
    'Invoice', // Corrected spelling
  ];

  // Fetch records from the server
  Future<void> fetchRecords() async {
    String link =
        '${AppLink.apiMyDoctorBaseUrl}/patient_records'; // Replace with your actual API URL
    var result = await crud.getDataDaynamic(link, {
      'Content-Type': 'application/json',
      'apikey': ApiKey, // Assuming Bearer token
    });

    result.fold(
      (error) {
        // Handle error and print status
        print('Error fetching records : $error');
      },
      (response) {
        // Print response and status code
        print('Response: $response');
        print('Status Code: 200'); // You can customize this if needed.
        records.clear();
        records.value =
            (response as List)
                .map((record) => Record.fromJson(record))
                .toList();
      },
    );
  }

  // Delete a record
  Future<void> deleteRecord(int id) async {
    String link =
        '${AppLink.apiMyDoctorBaseUrl}/patient_records?id=eq.$id'; // Remove extra slash
    var result = await crud.deleteData(link, {
      'Content-Type': 'application/json',
      'apikey': ApiKey, // Assuming Bearer token
      'Authorization': "Bearer $ApiKey",
    });

    result.fold(
      (error) {
        // Handle error and print status
        print('Error deleting record: $error');
      },
      (response) {
        // Print response and status code
        print('Response on deleting record: $response');
        records.removeWhere((record) => record.id == id);
      },
    );
  }

  // Add a new record
  Future<void> addRecord(String name, String date) async {
    String link =
        'https://nypnasqvpmjznqrbwhzl.supabase.co/rest/v1/patient_records'; // Remove extra slash

    // Debug: Print the request details
    print('Adding record with URL: $link');
    print('Request body: {"name": "$name", "created_at": "$date"}');
    print('Headers: apikey: $ApiKey, Authorization: Bearer $ApiKey');

    var result = await crud.postDataDynamic(
      link,
      {
        "name": name,
        "created_at": _formatDateForSupabase(date),
      }, // Remove ID, let Supabase auto-generate
      {
        'apikey': ApiKey,
        'Authorization': "Bearer $ApiKey",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Prefer':
            'return=representation', // Return the created record with its ID
      },
    );

    result.fold(
      (error) {
        // Handle error and print status
        print('Error adding record: $error');
        print('Error type: ${error.runtimeType}');
        print('Check the logs above for detailed request/response information');
      },
      (response) {
        // Print response and status code
        print('Response on adding record: $response');
        print('Record added successfully!');
        // Refresh the records list after adding
        fetchRecords();
      },
    );
  }
}
