import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/onboarding/controller/onboarding_controller.dart';
import 'package:adv/view/onboarding/screens/widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      child: GetBuilder(
          init: OnboardingController(),
          builder: (controller) {
            final List<Widget> pages = [
              OnboardingPage(
                onTapNext: controller.navigateToNextPage,
                image: AppAssets.img20,
                onTapSkip: controller.skipOnboarding,
                title: 'Find Trusted Doctors',
                circleImage: AppAssets.greenCircle,
                circlePosition: 'left',
              ),
              OnboardingPage(
                onTapNext: controller.navigateToNextPage,
                image: AppAssets.img21,q
                onTapSkip: controller.skipOnboarding,
                title: 'Choose Best Doctors',
                circleImage: AppAssets.greenCircle2,
                circlePosition: 'right',
              ),
              OnboardingPage(
                onTapNext: controller.navigateToNextPage,
                onTapSkip: controller.skipOnboarding,
                image: AppAssets.img22,
                title: 'Easy Appointments',
                circleImage: AppAssets.greenCircle,
                circlePosition: 'left',
              ),
            ];
            return SizedBox(
              height: 5,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: pages.length,
                // onPageChanged: (index) {
                //   if (index == pages.length - 1) Get.offAllNamed(Routes.signUp);
                // },
                itemBuilder: (_, index) => pages[index],
              ),
            );
          }),
    );
  }
}
