
import '../../../core/exports/ui_exports.dart';

class AddRecordController extends GetxController {
 var selectedIndex = (-1).obs; // Observable variable for selected index

 void selectButton(int index) {
  selectedIndex.value = index; // Update the selected index
}
 final List<String> svgPaths = [
  'assets/svgs/report.svg', // Path to your first SVG
  'assets/svgs/prescription.svg', // Path to your second SVG
  'assets/svgs/invoice.svg', // Path to your third SVG
 ];
 final List<String> TextPaths = [
  'report', // Path to your first SVG
  'prescription', // Path to your second SVG
  'invoic', // Path to your third SVG
 ];

void toggleIconPressed (){

}
}