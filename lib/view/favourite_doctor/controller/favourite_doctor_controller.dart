import 'package:adv/core/constant/app_keys.dart';
import 'package:adv/core/exports/ui_exports.dart';
import '../../../core/classes/crud.dart';
import '../../../core/classes/status_class.dart';
import '../../../core/services/app_link.dart';
import '../../../core/services/services.dart';
import '../../../models/favourite_doctor_model.dart';

class FavouriteDoctorController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<DoctorModel> doctors = <DoctorModel>[].obs;
  RxList<bool> isFavoriteGrid = <bool>[].obs;
  RxList<bool> isFavoriteList = <bool>[].obs;
  final Crud crud = Crud();
  final StorageService storageService = StorageService();

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  void toggleGridFavorite(int index) {
    print('🔄 toggleGridFavorite called for index: $index');
    deleteDoctorFromFavourite(index);
    fetchDoctors();
    isLoading.value = false;
  }

  void toggleListFavorite(int index) {
    print('🔄 toggleListFavorite called for index: $index');
    isFavoriteList[index] = !isFavoriteList[index];
  }

  @override
  void onInit() {
    print('🚀 FavouriteDoctorController onInit called');
    super.onInit();
    fetchDoctors();
  }

  void clearSearch() {
    print('🧹 clearSearch called');
    searchController.clear();
  }

  void fetchDoctors() async {
    print('📡 fetchDoctors started');
    isLoading.value = true;
    
    try {
      final String url = AppLink.allDoctorsFaivorite;
      print('🌐 URL: $url');
      
      // For Supabase API, we only need the apikey header, not the Authorization header
      final headers = {
        "Content-Type": "application/json",
        "apikey": AppKeys.apiKey,
        // Remove Authorization header for Supabase API
        // "Authorization": "Bearer $token"
      };
      print('📋 Headers: $headers');
      print('🔑 Using Supabase API key for authentication');
      
      print('📤 Making API request...');
      final response = await crud.getDataDaynamic(url, headers);
      
      print('📥 Response received');
      response.fold((failure) {
        print('❌ API call failed with failure: $failure');
        errorMessage.value = _mapFailureToMessage(failure);
        print('💬 Error message set to: ${errorMessage.value}');
        Get.snackbar('خطأ', errorMessage.value);
      }, (data) {
        print('✅ API call successful');
        print('📊 Raw data type: ${data.runtimeType}');
        print('📊 Raw data: $data');
        
        if (data is List) {
          print('📋 Data is a List with ${data.length} items');
          List doctorsJson = data;
          doctors.value = doctorsJson.map((e) {
            print('🏥 Processing doctor: $e');
            return DoctorModel.fromJson(e);
          }).toList();
          print('👥 Processed ${doctors.length} doctors');
          
          isFavoriteGrid.value = List<bool>.filled(doctors.length, false, growable: true);
          isFavoriteList.value = List<bool>.filled(doctors.length, false);
          print('⭐ Favorites lists initialized with ${doctors.length} items');
        } else {
          print('⚠️ Data is not a List, it is: ${data.runtimeType}');
          errorMessage.value = 'Invalid data format received';
        }
      });
    } catch (e) {
      print('💥 Exception in fetchDoctors: $e');
      errorMessage.value = 'Exception occurred: $e';
      Get.snackbar('خطأ', 'Exception: $e');
    }
    
    print('🏁 fetchDoctors completed');
    isLoading.value = false;
  }

  Future<void> deleteDoctorFromFavourite(int index) async {
    print('🗑️ deleteDoctorFromFavourite started for index: $index');
    final doctorName = doctors[index].name;
    print('👨‍⚕️ Doctor name to delete: $doctorName');
    
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    
    try {
      final String url = AppLink.deleteDoctorsFromFaivorite + doctorName;
      print('🌐 Delete URL: $url');
      
      // For Supabase API, we only need the apikey header, not the Authorization header
      final headers = {
        "Content-Type": "application/json",
        "apikey": AppKeys.apiKey,
        // Remove Authorization header for Supabase API
        // "Authorization": "Bearer $token"
      };
      print('📋 Delete headers: $headers');
      print('🔑 Using Supabase API key for delete authentication');
      
      print('📤 Making delete request...');
      final result = await crud.deleteData(url, headers);
      
      final status = result.fold(
        (failure) {
          print('❌ Delete failed: $failure');
          return failure;
        },
        (success) {
          print('✅ Delete successful: $success');
          return Status_Classes.success;
        },
      );
      
      if (status == Status_Classes.success) {
        print('✅ Delete operation successful, updating UI');
        doctors.removeAt(index);
        isFavoriteGrid.removeAt(index);
        Get.back();
        Get.snackbar('Deleted', 'The doctor has been removed from favorites',
            duration: const Duration(seconds: 1));
      } else {
        print('❌ Delete operation failed');
        Get.back();
        Get.snackbar('Deletion Failed', 'An error occurred during deletion',
            duration: const Duration(seconds: 1));
      }
    } catch (e) {
      print('💥 Exception in deleteDoctorFromFavourite: $e');
      Get.back();
      Get.snackbar('Error', 'Exception during deletion: $e');
    }
  }

  String _mapFailureToMessage(Status_Classes failure) {
    print('🔍 Mapping failure: $failure');
    switch (failure) {
      case Status_Classes.Server_Error:
        print('🖥️ Server Error detected');
        return 'Server Error';
      case Status_Classes.Offline_Error:
        print('📡 Offline Error detected');
        return 'No Internet Connection';
      default:
        print('❓ Unknown error: $failure');
        return 'An unexpected error occurred';
    }
  }
}