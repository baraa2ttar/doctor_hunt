import 'package:adv/core/classes/crud.dart';
import 'package:adv/core/services/app_link.dart';
import 'package:adv/core/services/services.dart';
import '../../../core/exports/main_exports.dart';

class LoginController extends GetxController {
  var isPasswordObscured = true.obs;
  var isEmailValid = true.obs;
  var emailText = ''.obs;

  final StorageService _storageService = StorageService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Crud _crud = Crud();

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void validateEmail(String value) {
    emailText.value = value;
    isEmailValid.value = GetUtils.isEmail(value.trim());
  }

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    print("Logging in with: $body");

    var response = await _crud.postDataDynamic(
      AppLink.apiLogin,
      body,
      headers,
    );

    response.fold((error) {
      print("Login failed: $error");
      Get.snackbar("Login Failed", error.toString());
    }, (data) async {
      print("Login success: $data");

      if (data['status'] == true) {
        final token = data['data']['token'];

        if (token != null) {
          await _storageService.saveToken(token);
          print(" Token saved: $token");
        }

        Get.offAllNamed(Routes.navbar);
      } else {
        Get.snackbar("Login Error", data['message'] ?? "Something went wrong");
      }
    });
  }
}