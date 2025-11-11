import 'dart:convert';

import 'package:adv/core/classes/crud.dart';
import 'package:adv/core/services/app_link.dart';
import 'package:adv/core/services/services.dart';
import 'package:adv/models/simple_doctor_model.dart';

import '../../../core/exports/ui_exports.dart';

class FindDoctorController extends GetxController {
  final Crud crud = Crud();
  final StorageService storageService = StorageService();
  RxList<SimpleDoctor> doctorList = <SimpleDoctor>[].obs;
  RxBool isLoading = true.obs;

  bool isFavorite = false;
  bool isSelected = false;
  int dateSelectedIndex = 0;
  int selectTimeEavening = -1;
  int selectTimeAfternoon = -1;
  favorateChange() {
    isFavorite = !isFavorite;
    update();
  }






  Future<void> fetchDoctors() async {
  isLoading.value = true;

  String? token = await storageService.getToken();
  if (token == null) {
    isLoading.value = false;
    return;
  }

  final headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final url = AppLink.apiVCareLiveBaseUrl + AppLink.getAllDoctor;

  final response = await crud.getDataDaynamic(url, headers);

  response.fold(
    (error) {
      print('Error fetching doctors: $error');
      filteredList.clear();
    },
    (data) {
      final List fetched = data['data'];
      final List<Map<String, dynamic>> temp = [];

      for (int i = 0; i < fetched.length; i++) {
        final doc = fetched[i];

        // Match with fixed doctor data by ID or fallback to index
        final fixed = (i < doctorsList.length)
            ? doctorsList[i]
            : {
                "image": AppAssets.img1,
                "rating": 4.5,
                "stories": "23 patient stories",
                "time": "09:00 AM",
                "day": "Monday",
                "specialization": "General",
                "experience": "5",
              };

        temp.add({
          "name": doc["name"] ?? '',
          "specialization": fixed["specialization"] ?? '',
          "experience": fixed["experience"] ?? 0,
          "image": fixed["image"] ?? AppAssets.img1,
          "rating": fixed["rating"] ?? 0.0,
          "stories": fixed["stories"] ?? '',
          "time": doc["start_time"] ?? '',
          "day": fixed["day"] ?? '',
        });
      }

      filteredList.value = temp;
    },
  );

  isLoading.value = false;
}


  void changeSelectTimeEavening(int index) {
    selectTimeEavening = index;
    selectTimeAfternoon = -1;
    update();
  }

  void changeSelectTimeAfternoon(int index) {
    selectTimeAfternoon = index;
    selectTimeEavening = -1;

    update();
  }

  void selectDate(int index) {
    dateSelectedIndex = index;
    update();
  }
  
  void favoriteChange() {
    isFavorite = !isFavorite;
    update();
  }

  void changeSelectTimeEvening(int index) {
    selectTimeEavening = index;
    selectTimeAfternoon = -1;
    update();
  }

  final TextEditingController searchController = TextEditingController();
  RxList<Map<String, dynamic>> filteredList = <Map<String, dynamic>>[].obs;
  RxString searchQuery = ''.obs;
  RxMap<String, RxBool> favorites = <String, RxBool>{}.obs;


  @override
  void onInit() {
fetchDoctors();

    // filteredList.value = doctorsList;
    // for (var doctor in doctorsList) {
    //   favorites[doctor['name']] = false.obs;
    // }
    // searchController.addListener(() {
    //   filterDoctors(searchController.text);
    // });

      searchController.addListener(() {
      filterDoctors(searchController.text);
    });

    super.onInit();
  }


void filterDoctors(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      doctorList(); // Show all doctors when search is empty
    } else {
      searchDoctorAPI(query);
    }
  }

  void clearSearch() {
    searchController.clear();
    filterDoctors('');
  }

  Future<void> searchDoctorAPI(String query) async {
    print('[searchDoctorAPI] Called with query: $query');
    String? token = await storageService.getToken();
    print('[searchDoctorAPI] Token: $token');

    if (token == null) {
      print('[searchDoctorAPI] Token is null — cannot perform search');
      return;
    }

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token', // <-- Add Bearer here!
    };
    print('[searchDoctorAPI] Headers: $headers');

    final url = 'https://vcare.integration25.com/api/doctor/doctor-search?name=$query';
    print('[searchDoctorAPI] URL: $url');

    final response = await crud.getDataDaynamic(url, headers);
    print('[searchDoctorAPI] Raw response: $response');

    response.fold(
      (failure) {
        print('[searchDoctorAPI] API Error: $failure');
        doctorList.clear();
      },
      (data) {
        print('[searchDoctorAPI] API response: $data');
        if (data['status'] == true && data['data'] != null) {
         final List fetched = data['data'];

          final List<Map<String, dynamic>> temp = [];

          for (int i = 0; i < fetched.length; i++) {
            final doc = fetched[i];

            final fixed = (i < doctorsList.length)
                ? doctorsList[i]
                : {
                    "image": AppAssets.img1,
                    "rating": 4.5,
                    "stories": "23 patient stories",
                    "time": "09:00 AM",
                    "day": "Monday",
                    "specialization": "General",
                    "experience": 5,
                  };

            temp.add({
              "name": doc["name"] ?? '',
              "specialization": fixed["specialization"] ?? '',
              "experience": fixed["experience"] ?? 0,
              "image": fixed["image"] ?? AppAssets.img1,
              "rating": fixed["rating"] ?? 0.0,
              "stories": fixed["stories"] ?? '',
              "time": doc["start_time"] ?? '',
              "day": fixed["day"] ?? '',
            });
          }

          filteredList.value = temp;
        } else {
          filteredList.clear();
        }
      },
    );
  }



  // void filterDoctors(String query) {
  //   searchQuery.value = query;
  //   if (query.isEmpty) {
  //     filteredList.value = doctorsList;
  //   } else {
  //     filteredList.value = doctorsList.where((doctor) {
  //       final name = doctor['name'].toString().toLowerCase();
  //       return name.contains(query.toLowerCase());
  //     }).toList();
  //   }
  // }
  // void clearSearch() {
  //   searchController.clear();
  //   filterDoctors('');
  // }
  void toggleFavorite(String doctorName) {
    if (favorites.containsKey(doctorName)) {
      favorites[doctorName]!.value = !favorites[doctorName]!.value;
    } else {
      favorites[doctorName] = true.obs;
    }
  }
  bool isFavoriteDoctor(String doctorName) {
    return favorites[doctorName]?.value ?? true;
  }
  @override
  void onClose() {
    // searchController.dispose();
    super.onClose();
  }
}
