import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/login/screens/widgets/verify-code-sheet.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({super.key});
  @override
  Widget build(BuildContext context) {
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
                  alignment: Alignment.center,
                  width: context.w(130),
                  height: context.h(5),
                  margin: EdgeInsets.only(bottom: context.ph(20)),
                  decoration: BoxDecoration(
                    color: AppColor.greyColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // حسب فيغما لازم55
                SizedBox(height: 28.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.forgetPasswordTitle,
                    style: AppTextStyles.headline24(context),
                  ),
                ),
                SizedBox(height: context.ph(12)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.forgetPasswordSubtitle,
                    style: AppTextStyles.subtitle(context),
                  ),
                ),
                SizedBox(height: context.ph(36)),
                // حقل الإيميل
                AppTextFormField(hintText: "Email"),
                SizedBox(height: context.ph(30)),
                // زر المتابعة
                Align(
                  alignment: Alignment.center,
                  child: AppButton(
                    buttonWidth: 295.w,
                    buttonHeight: 54.h,
                    textStyle: AppTextStyles.buttonText(context),
                    borderRadius: 12.r,
                    buttonText: "Continue",
                    onTap: () {
                      Get.back();
                      CustomBottomSheet.show(
                        isScrollControlled: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        child: const VerifyCodeSheet(),
                      );
                    },
                  ),
                ),
                // حسب فيغما لازم 50
                SizedBox(height: context.ph(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
