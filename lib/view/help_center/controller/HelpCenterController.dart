import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final List<String> allOptions = [
    'Booking a new Appointment',
    'Existing Appointment',
    'Online consultations',
    'Feedbacks',
    'Medicine orders',
    'Diagnostic Tests',
    'Health plans',
    'My account and Practo Drive',
    'Have a feature in mind',
    'Other issues',
  ];

  RxList<String> filteredOptions = <String>[].obs;

  @override
  void onInit() {
    filteredOptions.value = allOptions;
    super.onInit();
  }

  void filterOptions(String query) {
    if (query.isEmpty) {
      filteredOptions.value = allOptions;
    } else {
      filteredOptions.value = allOptions
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void handleOptionTap(int index) {
    final selected = filteredOptions[index];
    Get.snackbar("Selected", selected);
    // Get.toNamed('/yourRoute');
  }
}
