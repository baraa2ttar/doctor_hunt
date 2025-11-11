import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/patient_details/screens/widgets/patient_details_form.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PatientDetailsController controller = Get.find();
    return AppBackground(
      drawer:CustomDrawer(),
      padding: EdgeInsets.only(bottom: context.keyboardHeight),
      child: Padding(
        padding:  EdgeInsets.all(context.pw(20)),
        child: Column(
          children: [
            AppTopBar(appBarText: "Patient Details"),
            SizedBox(height: 22.h),
            StepsProgressIndicator(),
            SizedBox(height: 22.h),
            PatientDetailsForm(),
            SizedBox(height: 38.h),
            AppButton(buttonHeight: 54.h,buttonWidth: 270.w, buttonText: "Continue", textStyle: AppTextStyles.buttonText(context).copyWith(fontSize: context.sp(18)), borderRadius: 6.r,onTap: controller.submit )
          ],
        ),
      ),
    );
  }
}
