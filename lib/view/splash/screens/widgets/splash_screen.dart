import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.appLogo,
                height: 120.h,
              ),
              SizedBox(height: 20.h),
              Text(
                'Doctor Hunt',
                style: AppTextStyles.headline(context),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
