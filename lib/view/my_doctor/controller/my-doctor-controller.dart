import 'package:adv/core/classes/crud.dart';
import 'package:adv/core/constant/app_keys.dart';
import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/core/services/app_link.dart';
import 'package:adv/core/services/services.dart';
import '../../../models/doctor_model.dart';

class MyDoctorController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxMap<String, RxBool> favorites = <String, RxBool>{}.obs;
  final Crud crud = Crud();

  RxString searchQuery = ''.obs;
  RxList<Doctor> doctorList = <Doctor>[].obs;
  RxList<Map<String, dynamic>> combinedDoctors = <Map<String, dynamic>>[].obs;

  final List<Map<String, dynamic>> fixedDoctorsList = doctorsList; 
  final StorageService storageService = StorageService();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    for (var doctor in fixedDoctorsList) {
      favorites[doctor['name']] = false.obs;
    }
    fetchDoctors();
    ever(doctorList, (_) {
      mergeLists();
    });

    super.onInit();
  }



  
  void toggleFavorite(String doctorName) {
    if (favorites.containsKey(doctorName)) {
      favorites[doctorName]!.value = !favorites[doctorName]!.value;
    } else {
      favorites[doctorName] = true.obs;
    }
  }

  bool isFavorite(String doctorName) {
    return favorites[doctorName]?.value ?? false;
  }

  Future<void> fetchDoctors() async {
    isLoading.value = true;
    final url = AppLink.apiMyDoctorBaseUrl + AppLink.getAllMyDoctors;
    final headers = {
      'apikey': AppKeys.apiKey,
      'Content-Type': 'application/json',
    };

    final result = await crud.getDataDaynamic(url, headers);

    result.fold(
      (error) {
        print('Error fetching doctors: $error');
      },
      (data) {
        // Handle the dynamic response - data might be a List directly or nested in a Map
        List<dynamic> doctorsData;
        if (data is List) {
          doctorsData = data;
        } else if (data is Map && data['data'] is List) {
          doctorsData = data['data'];
        } else {
          print('Unexpected data format: $data');
          return;
        }
        
        doctorList.value = doctorsData.map((item) => Doctor.fromJson(item)).toList();
      },
    );

    isLoading.value = false;
  }


  void mergeLists() {
  final List<Map<String, dynamic>> temp = [];

  for (var doc in doctorList) {
    final fixed = fixedDoctorsList.firstWhere(
      (fixedDoc) => fixedDoc['id'] == doc.id,
      orElse: () => {},
    );

    temp.add({
      'id': doc.id,
      'name': doc.name,
      'specialization': doc.specialty,
      'experience': doc.experienceYears,
      'image': fixed['image'] ?? AppAssets.img1,
      'rating': fixed['rating'] ?? 0.0,
      'stories': fixed['stories']?.toString() ?? '',
      'time': fixed['time'] ?? '',
      'day': fixed['day'] ?? '',
    });
  }

  combinedDoctors.value = temp;
}

  Future<void> deleteDoctorById(int id) async {
  final url = '${AppLink.apiMyDoctorBaseUrl}/mydoctor?id=eq.$id';
  final headers = {
    'apikey': AppKeys.apiKey,
    'Authorization': 'Bearer ${AppKeys.apiKey}',
    'Content-Type': 'application/json',
  };

  final result = await crud.deleteData(url, headers);
  result.fold(
    (error) {
      Get.snackbar('Error', 'Failed to delete doctor');
    },
    (data) {
      doctorList.removeWhere((doctor) => doctor.id == id);
      Get.snackbar('Success', 'Doctor deleted');
    },
  );
}

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

