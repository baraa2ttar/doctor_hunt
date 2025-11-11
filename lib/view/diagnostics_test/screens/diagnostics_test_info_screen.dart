import 'package:adv/core/exports/ui_exports.dart';

class DiagnosticsTestInfoScreen extends StatelessWidget {
  const DiagnosticsTestInfoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBackground(
        child: AppGeneralInfo(
          appTopBarText: "Diagonstics Tests",
          title:"You haven’t booked any tests yet" ,
          subTitle: "Get started with your first health checkup",
          buttonText: "Book Now",
          buttonHeight: 40.h,
          iconPath: AppAssets.testBooking,
          onTap: ()=>Get.toNamed(Routes.diagnosticsTest),
        ));}}

