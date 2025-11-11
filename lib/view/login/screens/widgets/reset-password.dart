import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/login/controller/reset-password-controller.dart';
import 'package:adv/view/login/screens/widgets/verify-code-sheet.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());

    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.only(top: context.ph(10)),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: context.w(130),
                  height: context.h(5),
                  margin: EdgeInsets.only(bottom: context.ph(20)),
                  decoration: BoxDecoration(
                    color: AppColor.greyColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: context.ph(35)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reset Password",
                    style: AppTextStyles.headline24(context),
                  ),
                ),
                SizedBox(height: context.ph(12)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please enter your new password below.",
                    style: AppTextStyles.subtitle(context),
                  ),
                ),
                SizedBox(height: context.ph(27)),
                Obx(
                  () => AppTextFormField(
                    hintText: "New Password",
                    isObscureText: controller.isPasswordObscured.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.darkGreyColor,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: context.ph(18)),

                Obx(
                  () => AppTextFormField(
                    hintText: "Re-enter Password",
                    isObscureText: controller.isConfirmObscured.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.darkGreyColor,
                      ),
                      onPressed: controller.toggleConfirmVisibility,
                    ),
                  ),
                ),
                SizedBox(height: context.ph(38)),

                // زر الاستمرار
                AppButton(
                  buttonHeight: 54.h,
                  buttonWidth: 295.w,

                  textStyle: AppTextStyles.buttonText(context),
                  borderRadius: 12.r,
                  buttonText: "Update Password",
                  onTap: () {
                    print("Password changed");
                    Get.back();
                    CustomBottomSheet.show(
                      isScrollControlled: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      child: const VerifyCodeSheet(),
                    );
                  },
                ),

                //  مسافة سفلية حسب فيغما لازم 50
                SizedBox(height: context.ph(40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
