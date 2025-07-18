import 'package:get/get.dart';

class AddRecordController extends GetxController {
 // Observable variable for selected index
 var selectedIndex = (-1).obs;

 // Method to update the selected index
 void selectButton(int index) {
  selectedIndex.value = index;
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
}