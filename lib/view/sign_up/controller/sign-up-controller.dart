import 'package:adv/core/classes/crud.dart';
import 'package:adv/core/routing/routes.dart';
import 'package:adv/core/services/app_link.dart';
import 'package:adv/core/services/services.dart';
import 'package:get/get.dart';
class SignUpController extends GetxController {
  var isSelected = false.obs;
  var isPasswordObscured = true.obs;
  final StorageService _storageService = StorageService();

  void toggleSelection() {
    isSelected.value = !isSelected.value;
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  final Crud _crud = Crud();

  // ✅ توليد رقم هاتف عشوائي يبدأ بـ 09
  String generateRandomPhone() {
    final random = DateTime.now().millisecondsSinceEpoch.remainder(1000000000);
    return '09$random';
  }

  Future<void> signUpUser() async {
    print(">> Sending signup request...");
    print(">> Name: ${name.value}");
    print(">> Email: ${email.value}");
    print(">> Password: ${password.value}");

    String phone = generateRandomPhone();

    Map<String, dynamic> body = {
      "name": name.value,
      "email": email.value,
      "password": password.value,
      "password_confirmation": password.value,
      "phone": phone,
      "gender": "0",
    };
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await _crud.postDataDynamic(AppLink.apiCreateAcount, body, headers);

    response.fold(
      (error) {
        print(">> ERROR: $error");
        Get.snackbar("Error", error.toString());
      },
      (data) async {
        print(">> SUCCESS: $data");

        if (data['status'] == true) {
          final token = data['data']['token'];
          if (token != null) {
            await _storageService.saveToken(token);
            print("Token saved: $token");
          }
          Get.offAllNamed(Routes.navbar);
        } else {
          String errorMsg = data['message'] ?? "Registration failed";
          Get.snackbar("Failed", errorMsg);
        }
      },
    );
  }
}