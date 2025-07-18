import 'package:get/get.dart';
import '../../../core/exports/ui_exports.dart';
class AllRecordController extends GetxController {
  var records = <Record>[
    Record(date: '27 FEB', name: 'Abdullah Mamun', prescriptions: '1 Prescription'),
    Record(date: '28 FEB', name: 'Abdullah Shuvo', prescriptions: '1 Prescription'),
    Record(date: '01 MAR', name: 'Shruti Kedia', prescriptions: '1 Prescription'),
  ].obs; // Observable list of records
}