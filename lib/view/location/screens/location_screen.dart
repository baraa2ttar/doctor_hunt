import '../../../core/exports/ui_exports.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer:CustomDrawer(),
      child: AppGeneralInfo(
        onTap: ()=> Get.toNamed(Routes.orderList),
        appTopBarText: "Enable Location Services",
        iconPath: "assets/svgs/location.svg",
        buttonText: "Enable Location",
        title: "Location",
        subTitle: "Your location services are switched off. Please enable location, to help us serve better.",
        iconWidth: 119.w,
      ),
    );
  }
}

