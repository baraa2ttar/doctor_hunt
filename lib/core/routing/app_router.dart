import 'package:adv/core/routing/routes.dart';
import 'package:adv/view/add_record/screens/add_record_screen.dart';
import 'package:adv/view/diagnostics_test/screens/diagnostics_test_screen.dart';
import 'package:adv/view/onboarding/screens/onboarding_screen.dart';
import 'package:adv/widgets/app_navbar.dart';
import 'package:get/get.dart';


final List<GetPage> appPages = [

  //GetPage(name: Routes.diagnosticsTest, page: () => OnboardingScreen()),
 // GetPage(name: Routes.navbar, page: () => BottomNavbar()),
  GetPage(name: Routes.addRecord, page: () => AddRecordScreen()),
  //GetPage(name: Routes.diagnosticsTest, page: () => DiagnosticsTestScreen()),

];
