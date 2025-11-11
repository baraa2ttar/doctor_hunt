import 'package:adv/core/exports/main_exports.dart';
class ResetPasswordController extends GetxController {
  var isPasswordObscured = true.obs;
  var isConfirmObscured = true.obs;
  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void toggleConfirmVisibility() {
    isConfirmObscured.value = !isConfirmObscured.value;
  }
}
