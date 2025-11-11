import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/add_record/screens/add_record_screen.dart';
import 'package:adv/view/all_record/screens/all_record_screen.dart';
import 'package:adv/view/diagnostics_test/screens/diagnostics_test_info_screen.dart';
import 'package:adv/view/doctor_appointment/screens/doctor_appointment_screen.dart';
import 'package:adv/view/doctor_appointment/screens/doctor_appointment_screen_next.dart';
import 'package:adv/view/doctor_appointment/screens/widgets/thank_you_dialog.dart';
import 'package:adv/view/doctor_details/screens/doctor_details_screen.dart';
import 'package:adv/view/doctor_live_chat/screen/docotr_live_chat_screen.dart';
import 'package:adv/view/doctors/controller/doctor_controller.dart';
import 'package:adv/view/find_doctor/screens/available_time_screen.dart';
import 'package:adv/view/help_center/screens/help_center_screen.dart';
import 'package:adv/view/location/screens/location_screen.dart';
import 'package:adv/view/login/screens/login_screen.dart';
import 'package:adv/view/medical_record/screens/medical_record_screen.dart';
import 'package:adv/view/medicine_order/screens/medicine_order_list_screen.dart';
import 'package:adv/view/medicine_order/screens/medicine_order_screen.dart';
import 'package:adv/view/my_doctor/screens/my_doctor_screen.dart';
import 'package:adv/view/onboarding/screens/onboarding_screen.dart';
import 'package:adv/view/patient_details/screens/patient_details_screen.dart';
import 'package:adv/view/patient_details/screens/widgets/patient_details_form.dart';
import 'package:adv/view/popular_doctor/screens/popular_doctor_screen.dart';
import 'package:adv/view/privacy_policy/screens/privacy_policy_screen.dart';
import 'package:adv/view/profile/controller/profile_controller.dart';
import 'package:adv/view/profile/screens/profile_screen.dart';
import 'package:adv/view/settings/controller/settings_controller.dart';
import 'package:adv/view/settings/screens/settings_screen.dart';
import 'package:adv/view/sign_up/screens/sign_up_screen.dart';
import 'package:adv/widgets/app_navbar.dart';
import 'package:adv/view/splash/screens/widgets/splash_screen.dart';
import 'package:adv/view/find_doctor/screens/select_time_screen.dart';
import 'package:adv/view/find_doctor/screens/find_doctor_screen.dart';

final List<GetPage> appPages = [
  GetPage(name: Routes.navbar, page: () => AppNavBarView(),binding: BindingsBuilder(() {Get.lazyPut(() => DoctorsController(), fenix: true);})),
  GetPage(name: Routes.diagnosticsTest, page: () => const DiagnosticsTestScreen()),
  GetPage(name: Routes.patientDetails, page: () => const PatientDetailsScreen(), binding: BindingsBuilder(() {Get.lazyPut(() => PatientDetailsController(), fenix: true);}),),
  GetPage(name: Routes.patientForm, page: () => const PatientDetailsForm()),
  GetPage(name: Routes.onboarding, page: () =>  OnboardingScreen()),
  GetPage(name: Routes.privacyPolicy, page: () => const PrivacyPolicyScreen()),
  GetPage(name: Routes.settings, page: () => const SettingsScreen(),binding: BindingsBuilder(() {Get.lazyPut(() => SettingsController(), fenix: true);}),),
  GetPage(name: Routes.emptyDetails, page: () => const EmptyDetails()),
  GetPage(name: Routes.doctors, page: () => const DoctorsScreen(),binding: BindingsBuilder(() {Get.lazyPut(() => DoctorsController(), fenix: true);})),
  GetPage(name: Routes.profile, page: () => const ProfileScreen(),binding: BindingsBuilder(() {Get.lazyPut(() => ProfileController(), fenix: true);})),


  GetPage(name: Routes.doctorAppointment, page: () => const DoctorAppointmentScreen()),
  GetPage(name: Routes.doctorDetails, page: () => const DoctorDetailsScreen()),
  GetPage(name: Routes.availableTime, page: () => const AvailableTimeScreen()),
  
  GetPage(name: Routes.popularDoctor, page: () => const PopularDoctorScreen()),
  GetPage(name: Routes.thankYouDialog, page: () => const ThankYouDialog()),
  GetPage(name: Routes.doctorAppointmentNext, page: () => const DoctorAppointmentScreenNext()),
  GetPage(name: Routes.myDoctor, page: () =>  MyDoctorsScreen()),



  GetPage(name: Routes.splash, page: () => SplashScreen()), 
  GetPage(name: Routes.home, page: () => const HomeMainScreen()), 
  GetPage(name: Routes.selectTime, page: () =>  SelectTimeScreen()),
  GetPage(name: Routes.findDoctor, page: () =>  FindDoctorScreen()),

  GetPage(name: Routes.login, page: () =>  LoginScreen()),
  GetPage(name: Routes.signUp, page: () =>  SignUpScreen()),
  GetPage(name: Routes.menu, page: () =>  CustomDrawer()),
  
  GetPage(name: Routes.medicalRecord, page: () =>  MedicalRecordScreen()),
  GetPage(name: Routes.addRecord, page: () =>  AddRecordScreen()),
  GetPage(name: Routes.allRecord, page: () =>  AllRecordScreen()),
  GetPage(name: Routes.location, page: () =>  LocationScreen()),
  GetPage(name: Routes.medicineOrder, page: () =>  MedicineOrderScreen()),

  GetPage(name: Routes.diagnosticsInfo, page: () =>  DiagnosticsTestInfoScreen()),
  GetPage(name: Routes.chat, page: () =>  DoctorLiveChatScreen()),
  GetPage(name: Routes.orderList, page: () =>  MedicineOrderListScreen()),
  GetPage(name: Routes.helpCenter, page: () =>  HelpCenterScreen()),



];
