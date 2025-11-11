import 'package:adv/core/constant/app_constants.dart';
import 'package:adv/core/helpers/validation_service.dart';
import 'package:get/get.dart';

class PatientDetailsController extends GetxController {
  final RxString name = ''.obs;
  final RxString mobile = ''.obs;
  final RxString email = ''.obs;
  final RxString selectedDay = ''.obs;
  final RxString selectedMonth = ''.obs;
  final RxString selectedYear = ''.obs;
  final RxString selectedGender = ''.obs;

  final RxnString nameError = RxnString();
  final RxnString mobileError = RxnString();
  final RxnString emailError = RxnString();

  final RxInt completedSteps = 0.obs;
  final int totalSteps = 4;

  double get progress => (completedSteps.value / totalSteps).clamp(0.0, 1.0);


  void _updateProgress() {
    int count = 0;

    if (_isNameStepValid()) count++;
    if (_isAgeGenderStepValid()) count++;
    if (_isMobileStepValid()) count++;
    if (_isEmailStepValid()) count++;

    completedSteps.value = count;
  }

  bool _isNameStepValid() {
    return ValidationService.requiredField(name.value, fieldName: "Patient's Name") == null;
  }

  bool _isAgeGenderStepValid() {
    final dobValid = selectedDay.value.isNotEmpty &&
        selectedMonth.value.isNotEmpty &&
        selectedYear.value.isNotEmpty;
    final genderValid = selectedGender.value.isNotEmpty;
    return dobValid && genderValid;
  }

  bool _isMobileStepValid() {
    return ValidationService.phone(mobile.value) == null;
  }

  bool _isEmailStepValid() {
    return ValidationService.email(email.value) == null;
  }

  // Reactive handlers
  void onNameChanged(String val) {
    name.value = val;
    nameError.value = ValidationService.requiredField(val, fieldName: "Patient's Name");
    _updateProgress();
  }

  void onMobileChanged(String val) {
    mobile.value = val;
    mobileError.value = ValidationService.phone(val);
    _updateProgress();
  }

  void onEmailChanged(String val) {
    email.value = val;
    emailError.value = ValidationService.email(val);
    _updateProgress();
  }

  void onDayChanged(String? val) {
    selectedDay.value = val ?? '';
    _updateProgress();
  }

  void onMonthChanged(String? val) {
    selectedMonth.value = val ?? '';
    _updateProgress();
  }

  void onYearChanged(String? val) {
    selectedYear.value = val ?? '';
    _updateProgress();
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
    _updateProgress();
  }

  bool validateAllFields() {
    nameError.value = ValidationService.requiredField(name.value, fieldName: "Patient's Name");
    mobileError.value = ValidationService.phone(mobile.value);
    emailError.value = ValidationService.email(email.value);
    final dobValid = selectedDay.value.isNotEmpty &&
        selectedMonth.value.isNotEmpty &&
        selectedYear.value.isNotEmpty;
    final genderValid = selectedGender.value.isNotEmpty;
    return nameError.value == null &&
        mobileError.value == null &&
        emailError.value == null &&
        dobValid &&
        genderValid;
  }

  String getSelectedDateForApi() {
    final day = selectedDay.value.padLeft(2, '0');
    final month = (AppConstants.monthOptions.indexOf(selectedMonth.value) + 1).toString().padLeft(2, '0');
    return '${selectedYear.value}-$month-$day';
  }

  void submit() {
    if (validateAllFields()) {
      final dobForApi = getSelectedDateForApi();
      final gender = selectedGender.value;
      print("Sending to API: name:$name number:$mobile email:$email date:$dobForApi gender:$gender");
    } else {
      print("Form not valid");
    }
  }
}

