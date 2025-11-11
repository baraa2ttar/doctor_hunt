 import 'package:get/get.dart';

class MedicineOrderController extends GetxController {
  final searchText = ''.obs;

  void updateSearchText(String value) {
    searchText.value = value;
    print('تم البحث عن: $value');

  }

  void clearSearchText() {
    searchText.value = '';
    print('تم مسح النص');
  }
}
