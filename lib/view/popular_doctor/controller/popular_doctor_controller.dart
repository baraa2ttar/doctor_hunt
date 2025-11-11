import 'package:adv/core/exports/main_exports.dart';
import 'package:adv/view/popular_doctor/screens/popular_doctor_screen.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dartz/dartz.dart';

import '../../../core/classes/crud.dart';
import '../../../core/services/app_link.dart';
import '../../../core/constant/app_keys.dart';
import '../../../core/helpers/generate_rating_helper.dart';
import '../../../core/services/services.dart';
import '../../../core/classes/status_class.dart';

class PopularDoctorController extends GetxController {
  List<bool> isFavoriteList = List.generate(namesList1.length, (_) => false);
  final Crud crud = Crud();
  final StorageService storageService = StorageService();

  var isLoading = false.obs;
  var addStatus = Status_Classes.Isloading.obs;
  void toggleFavorite(
      {required int index,
        required String name,
        required String category,
        required int experienceYears}) {
    if (!isFavoriteList[index]) {
      addDoctorToFavourite(
        name: name,
        category: category,
        experienceYears: experienceYears,
      );
    } else {
      deleteDoctorFromFavourite(name);
    }

    isFavoriteList[index] = !isFavoriteList[index];
    update();
  }

  Future<void> deleteDoctorFromFavourite(String name) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    final String url = AppLink.deleteDoctorsFromFaivorite + name;
    final token = await storageService.getToken();
    final headers = {
      "Content-Type": "application/json",
      "apikey": AppKeys.apiKey,
      "Authorization": "Bearer $token"
    };
    final result = await crud.deleteData(url, headers);
    final status = result.fold(
      (failure) {
        print('❌ فشل في الحذف: $failure');
        return failure;
      },
      (success) {
        print('✅ تم الحذف بنجاح: $success');
        return Status_Classes.success;
      },
    );
    if (status == Status_Classes.success) {
      Get.back();
      Get.snackbar('Deleted', 'The doctor has been removed from favorites',
          duration: const Duration(seconds: 1));
    } else {
      Get.back();
      Get.snackbar('Deletion Failed', 'An error occurred during deletion',
          duration: const Duration(seconds: 1));
    }
  }

  Future<void> addDoctorToFavourite({
    required String name,
    required String category,
    required int experienceYears,
  }) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    const String url = AppLink.addFavouriteDoctor;
    final token = await storageService.getToken();
    final headers = {
      "Content-Type": "application/json",
      "apikey": AppKeys.apiKey,
      "Authorization": "Bearer $token",
    };
    final Map<String, dynamic> body = {
      "name": name,
      "category": category,
      "experience_years": experienceYears,
      "rating": HelperClass.generateRandomRating(),
      "review": HelperClass.generateRandomViews(),
    };
    final result = await crud.postDataDynamic(url, body, headers);
    final status = result.fold(
      (failure) {
        print('❌ فشل في الإضافة: $failure');
        return failure;
      },
      (success) {
        print('✅ تمت الإضافة بنجاح: $success');
        return Status_Classes.success;
      },
    );
    addStatus.value = status;
    if (status == Status_Classes.success) {
      Get.back();
      Get.snackbar('Added', 'The doctor has been Added from favorites',
          duration: const Duration(seconds: 1));
    } else {
      Get.back();
      Get.snackbar('Added', 'The doctor has not been Added from favorites',
          duration: const Duration(seconds: 1));
    }
    update();
  }
}
