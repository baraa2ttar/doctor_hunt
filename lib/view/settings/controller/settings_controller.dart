import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isFirstIconToggled = true.obs;
  RxBool isSecondIconToggled = true.obs;

  void toggleFirstIcon() {
    isFirstIconToggled.value = !isFirstIconToggled.value;
  }

  void toggleSecondIcon() {
    isSecondIconToggled.value = !isSecondIconToggled.value;
  }
}

