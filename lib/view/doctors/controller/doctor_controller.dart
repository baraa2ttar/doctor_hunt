import 'package:adv/core/classes/crud.dart';
import 'package:adv/core/constant/app_constants.dart';
import 'package:adv/core/services/app_link.dart';
import 'package:adv/core/services/services.dart';
import 'package:adv/models/specialization_model.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxList<bool> isFavoriteList = <bool>[].obs;
  final Crud crud = Crud();
  final StorageService storageService = StorageService();

  final RxList doctorsList = <SpecializationModel>[].obs;
  final RxList allDoctorsList = <SpecializationModel>[].obs;
  final RxBool isLoading = false.obs;
  
  // Specialization mapping for API calls
  final Map<String, int> specializationIds = {
    "All": 0,
    "Cardiology": 1,
    "Dermatology": 2,
    "Neurology": 3,
    "Orthopedics": 4,
    "Pediatrics": 5,
    "Gynecology": 6,
    "Ophthalmology": 7,
    "Urology": 8,
    "Gastroenterology": 9,
    "Psychiatry": 10,
    // "Dentist": 11,  // there is no 11 and no dentsit in api be aware 
  };

  @override
  void onInit() {
    super.onInit();
    fetchAllDoctors();
  }

  void selectLabel(int index) {
    selectedIndex.value = index;
    filterDoctorsBySpecialization(index);
  }

  void toggleFavorite(int index) {
    if (index < isFavoriteList.length) {
      isFavoriteList[index] = !isFavoriteList[index];
    }
  }

  void updateFavoriteList() {
    isFavoriteList.clear();
    isFavoriteList.addAll(List.generate(doctorsList.length, (_) => true));
  }

  void filterDoctorsBySpecialization(int labelIndex) {
    if (labelIndex == 0) {
      // Show all doctors
      doctorsList.assignAll(allDoctorsList);
      updateFavoriteList();
    } else {
      // Filter by specific specialization
      fetchDoctorsBySpecialization(labelIndex);
    }
  }

  void fetchAllDoctors() async {
    isLoading.value = true;
    String? token = await storageService.getToken();
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final result = await crud.getDataDaynamic(AppLink.apiVCareLiveBaseUrl + AppLink.getAllSpecialization, headers);

    result.fold(
      (error) {
        isLoading.value = false;
        Get.snackbar("Error", "Something went wrong");
      },
      (data) {
        final List<SpecializationModel> tempList = [];
        final List<dynamic> specializations = data['data'];

        for (int i = 0; i < specializations.length; i++) {
          final List<dynamic> doctors = specializations[i]['doctors'];
          for (int j = 0; j < doctors.length; j++) {
            final SpecializationModel doctor = SpecializationModel.fromJson(doctors[j]);

            final int index = tempList.length;
            if (index < kFakeDoctors.length) {
              tempList.add(doctor.copyWithImage(kFakeDoctors[index]["image"]!));
            } else {
              tempList.add(doctor);
            }
          }
        }

        allDoctorsList.assignAll(tempList);
        doctorsList.assignAll(tempList);
        updateFavoriteList();
        isLoading.value = false;
      },
    );
  }

  void fetchDoctorsBySpecialization(int labelIndex) async {
    isLoading.value = true;
    String? token = await storageService.getToken();
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    // Get the specialization name from the labels list
    final List<String> labels = ["All", "Dentist", "Cardiology", "Psychiatry", "Dermatology", "Neurology", "Orthopedics", "Pediatrics", "Gynecology", "Ophthalmology", "Urology", "Gastroenterology"];
    final String specializationName = labels[labelIndex];
    final int? specializationId = specializationIds[specializationName];

    if (specializationId == null || specializationId == 0) {
      // Show all doctors
      doctorsList.assignAll(allDoctorsList);
      updateFavoriteList();
      isLoading.value = false;
      return;
    }

    final result = await crud.getDataDaynamic(
      AppLink.apiVCareLiveBaseUrl + AppLink.getSpecializationById + specializationId.toString(),
      headers
    );

    result.fold(
      (error) {
        isLoading.value = false;
        Get.snackbar("Error", "Something went wrong");
      },
      (data) {
        final List<SpecializationModel> tempList = [];
        final List<dynamic> doctors = data['data']['doctors'];

        for (int i = 0; i < doctors.length; i++) {
          final SpecializationModel doctor = SpecializationModel.fromJson(doctors[i]);

          final int index = tempList.length;
          if (index < kFakeDoctors.length) {
            tempList.add(doctor.copyWithImage(kFakeDoctors[index]["image"]!));
          } else {
            tempList.add(doctor);
          }
        }

        doctorsList.assignAll(tempList);
        updateFavoriteList();
        isLoading.value = false;
      },
    );
  }
}



