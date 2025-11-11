import 'package:adv/core/exports/main_exports.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  navigateToNextPage() {
    if (pageController.page == 2) Get.offAllNamed(Routes.signUp);
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  skipOnboarding() => Get.offAllNamed(Routes.signUp);
}
