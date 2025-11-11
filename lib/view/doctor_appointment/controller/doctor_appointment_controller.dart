import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/core/services/services.dart';
import 'package:adv/view/doctor_appointment/screens/widgets/confirm_bottom_sheet.dart';
import '../../../core/classes/crud.dart';
import '../../../core/classes/status_class.dart';
import '../screens/widgets/thank_you_dialog.dart';

class DoctorAppointmentController extends GetxController {
  List<bool> isFavoriteList = [];
  final Crud crud = Crud();
  final StorageService storageService = StorageService();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  int selectedTimeIndex = 2;
  int selectedReminderIndex = 2;

  int? doctorId;
  Map<String, dynamic>? doctorData;

  @override
  void onInit() {
    print('🚀 DoctorAppointmentController onInit called');
    // if (Get.arguments != null && Get.arguments['doctorId'] != null) {
    doctorId = 25;
    print('👨‍⚕️ Doctor ID set to: $doctorId');
    fetchDoctorDetails();
    //}
    super.onInit();
  }

  Future<void> fetchDoctorDetails() async {
    print('📡 fetchDoctorDetails started');
    
    final token = await storageService.getToken();
    print('🔑 Token retrieved: ${token != null ? "Token exists" : "Token is null"}');
    print('🔑 Token length: ${token?.length ?? 0}');
    
    if (doctorId == null) {
      print('❌ Doctor ID is null');
      return;
    }
    
    if (token == null || token.isEmpty) {
      print('❌ No valid token found!');
      return;
    }

    final url = 'https://vcare.integration25.com/api/doctor/show/$doctorId';
    print('🌐 URL: $url');
    
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json', // Changed from x-www-form-urlencoded
      'Authorization': 'Bearer $token', // Added 'Bearer ' prefix
    };
    print('📋 Headers: $headers');
    print('🔐 Authorization header: "Bearer $token"');

    print('📤 Making API request...');
    final response = await crud.getDataDaynamic(url, headers);
    
    print('📥 Response received');
    response.fold((error) {
      print('❌ API call failed with error: $error');
      print('💬 Error message: ${_mapFailureToMessage(error)}');
      doctorData = null;
      update();
    }, (data) {
      print('✅ API call successful');
      print('📊 Raw data: $data');
      print('📊 Data type: ${data.runtimeType}');
      
      if (data is Map && data.containsKey('data')) {
        doctorData = data['data'];
        print('👨‍⚕️ Doctor data set: $doctorData');
      } else {
        print('⚠️ Unexpected data format: $data');
        doctorData = null;
      }
      update();
    });
  }

  void setSelectedDate(DateTime date) {
    print('📅 Date selected: $date');
    selectedDate = date;
    update();
  }

  Future<dynamic> openBottomSheet() {
    print('📋 Opening bottom sheet');
    return CustomBottomSheet.show(
      height: 355.h,
      useSafeArea: true,
      withShadow: true,
      barrierColor: Colors.transparent,
      child: const ConfirmBottomSheet(),
    );
  }

  nextButtonNavigating() {
    print('➡️ Navigating to next screen');
    Get.toNamed(Routes.doctorAppointmentNext);
  }

  void toggleFavorite(int index) {
    print('⭐ Toggle favorite for index: $index');
    if (index < isFavoriteList.length) {
      isFavoriteList[index] = !isFavoriteList[index];
      update();
    }
  }

  void selectTime(int index) {
    print('⏰ Time selected: index $index');
    selectedTimeIndex = index;
    update();
  }

  void selectReminder(int index) {
    print('🔔 Reminder selected: index $index');
    selectedReminderIndex = index;
    update();
  }

  Future<void> storeAppointment() async {
    print('📝 storeAppointment started');
    
    final token = await storageService.getToken();
    print('🔑 Token for appointment: ${token != null ? "Token exists" : "Token is null"}');
    
    if (token == null || token.isEmpty) {
      print('❌ No valid token found for appointment!');
      Get.snackbar('Error', 'Authentication token not found. Please login again.');
      return;
    }
    
    final link = "https://vcare.integration25.com/api/appointment/store";
    print('🌐 Appointment URL: $link');
    
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Added 'Bearer ' prefix
    };
    print('📋 Appointment headers: $headers');

    final body = {
      'doctor_id': doctorId.toString(),
      'start_time': '2025-12-10 05:00',
      'phone': contactNumberController.text,
      'date': selectedDate.toString().substring(0, 10),
      'time': '${timeList[selectedTimeIndex]}:00'
    };
    print('📦 Request body: $body');

    print('📤 Making appointment request...');
    final response = await crud.postDataDynamic(link, body, headers);
    
    print('📥 Appointment response received');
    response.fold((error) {
      print('❌ Appointment creation failed: $error');
      print('💬 Error message: ${_mapFailureToMessage(error)}');
      Get.snackbar('Error', 'Failed to create appointment: ${_mapFailureToMessage(error)}');
    }, (data) {
      print('✅ Appointment created successfully');
      print('📊 Response data: $data');
      Get.dialog(const ThankYouDialog(), barrierDismissible: false);
    });
  }

  String _mapFailureToMessage(dynamic failure) {
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

  @override
  void onClose() {
    print('🔚 DoctorAppointmentController disposing');
    patientNameController.dispose();
    contactNumberController.dispose();
    super.onClose();
  }
}
