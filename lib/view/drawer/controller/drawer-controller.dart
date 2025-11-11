import 'package:adv/core/classes/crud.dart';
import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/core/services/app_link.dart';
import 'package:adv/core/services/services.dart';

class DrawerrController extends GetxController {
  var selectedItem = ''.obs;
  final Crud _crud = Crud();
  final StorageService _storageService = StorageService();
  void selectItem(String title) {
    selectedItem.value = title;
  }
  Future<void> logout() async {
    final token = await _storageService.getToken();
    if (token == null) {
      Get.snackbar("error", "لم يتم العثور على التوكن");
      return;
    }
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    const url = AppLink.apiLogout;
    final response = await _crud.postDataDynamic(url, {}, headers);
    response.fold((error) {
      print(" Logout failed: $error");
      Get.snackbar("Logout Failed", "حدث خطأ أثناء تسجيل الخروج");
    }, (data) async {
      print(" Logout Success: $data");
      if (data["status"] == true) {
        await _storageService.removeToken();
        Get.offAllNamed(Routes.login);
        Get.snackbar("You're logged out", "See you later");
      } else {
        Get.snackbar("Logout failed", data["message"] ?? "حدث خطأ غير متوقع");
      }
    });
  }
}
