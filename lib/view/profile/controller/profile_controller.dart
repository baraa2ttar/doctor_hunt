import 'package:adv/core/classes/crud.dart';
import 'package:adv/core/classes/status_class.dart';
import 'package:adv/core/services/app_link.dart';
import 'package:adv/core/services/services.dart';
import 'package:adv/models/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {

  RxString name = "".obs;
  RxString mobile = "".obs;
  RxString birth = "DD MM YYYY".obs;
  RxString location = "Add Details".obs;

  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController birthController;
  late TextEditingController locationController;

  final Crud crud = Crud();
  final StorageService storageService = StorageService();

  Rxn<UserModel> user = Rxn<UserModel>();
  RxBool isLoading = true.obs;
  bool hasFetched = false;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    birthController = TextEditingController();
    locationController = TextEditingController();
    
    if (!hasFetched) {
    fetchUserProfile();
    hasFetched = true;
  }
  }
  
  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    String? token = await storageService.getToken();
      if (token == null || token.isEmpty) {
      print("No token found.");
      return;
    }

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await crud.getDataDaynamic(
      AppLink.apiVCareLiveBaseUrl + AppLink.userProfie,
      headers,
    );

  response.fold((error) {
  print("Error fetching profile: $error");
}, (data) {
  print("=============> Fetched profile: $data");

  if (data['data'] != null && data['data'] is List && data['data'].isNotEmpty) {
    final userData = Map<String, dynamic>.from(data['data'][0]);
    user.value = UserModel.fromJson(userData);

    name.value = user.value?.name ?? '';
    mobile.value = user.value?.mobile ?? '';
    birthController.text = birth.value;
    locationController.text = location.value;
  } else {
    print("User data list is empty or missing");
  }
});
isLoading.value = false;
  }


  void initializeEditFieldControllers() {
    nameController.text = name.value;
    mobileController.text = mobile.value;
    birthController.text = birth.value;
    locationController.text = location.value;
  }


  void updateName(String newName) {
    name.value = newName;
  }

  void updateMobile(String newMobile) {
    mobile.value = newMobile;
  }

  void updateBirth(String newBirth) {
    birth.value = newBirth;
  }

  void updateLocation(String newLocation) {
    location.value = newLocation;
  }



Future<bool> updateProfile() async {
  final currentUser = user.value;

  if (currentUser == null) {
    Get.snackbar("Error", "User data is missing");
    return false;
  }

  String? token = await storageService.getToken();

  if (token == null || token.isEmpty) {
      print("No token found.");
      return false;
    }

  final headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
  print("Headers: $headers");

  // gender should be "0" or "1" string
  final genderValue = (currentUser.gender?.toLowerCase() == 'male') ? '0' : '1';


  final formData = currentUser.toFormData(
    updatedName: nameController.text,
    updatedPhone: mobileController.text,
  );

  formData['gender'] = genderValue;

  print("Sending update with body: $formData");

  final result = await crud.postFormData(
    AppLink.apiVCareLiveBaseUrl + AppLink.updateProfile,
    formData,
    headers,
  );

  return result.fold(
    (error) {
      if (error == Status_Classes.Offline_Error) {
        Get.snackbar("Connection Error", "No internet connection");
        print("No internet connection");
      } else {
        Get.snackbar("Update Failed", error.toString());
        print("Update Failed $error");
      }
      return false;
    },
    (data) {
      Get.snackbar("Success", "Profile updated successfully");
      fetchUserProfile();
      return true;
    },
  );
}

}
