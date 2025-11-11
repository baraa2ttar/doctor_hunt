// sign_up_screen.dart
import '../../../core/exports/ui_exports.dart';
import 'package:adv/view/sign_up/controller/sign-up-controller.dart';
import 'package:adv/view/sign_up/screens/widgets/card-Google-facebook.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 152.h),
            Center(
              child: Text(
                AppStrings.loginTitle,
                style: AppTextStyles.headline24(context),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: Text(
                AppStrings.loginSubTitle,
                style: AppTextStyles.subtitle(context),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 67.h),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardGoogleFacebook(
                  imagePath: AppAssets.google,
                  label: "Google",
                  textStyle: AppTextStyles.hintText(context),
                ),
                SizedBox(width: 15.w),

                CardGoogleFacebook(
                  imagePath: AppAssets.facebook,
                  label: "Facebook",
                  textStyle: AppTextStyles.hintText(context),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            AppTextFormField(
              height: 54.h,
              hintText: "Name",
              onChanged: (val) => controller.name.value = val,
              
            ),
            SizedBox(height: 18.h),

            AppTextFormField(
              height: 54.h,
              hintText: "Email",
              onChanged: (val) => controller.email.value = val,
            ),
            SizedBox(height: 18.h),

            Obx(
              () => AppTextFormField(
                height: 54.h,
                hintText: "Password",
                isObscureText: controller.isPasswordObscured.value,
                onChanged: (val) => controller.password.value = val,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordObscured.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: controller.toggleSelection,
                    child: Container(
                      alignment: Alignment.center,
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              controller.isSelected.value
                                  ? AppColor.primaryColor
                                  : AppColor.greyColor,
                          width: 2,
                        ),
                        color:
                            controller.isSelected.value
                                ? AppColor.primaryColor
                                : AppColor.lightGreyColor,
                      ),
                      child:
                          controller.isSelected.value
                              ? Icon(
                                Icons.check,
                                size: 14.w,
                                color: AppColor.whiteColor,
                              )
                              : null,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "I agree with the Terms of Service & Privacy Policy",
                    style: AppTextStyles.subtitleS12(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 54.h),
            Center(
              child: AppButton(
                buttonText: "Sign up",
                onTap: () => controller.signUpUser(),
                borderRadius: 12.r,
                buttonHeight: 54.h,
                buttonWidth: 295.w,
                textStyle: AppTextStyles.buttonText(context),
              ),
            ),
            SizedBox(height: 17.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account? ",
                  style: AppTextStyles.subtitle(
                    context,
                  ).copyWith(color: AppColor.primaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.login);
                    print("Login tapped");
                    Get.toNamed(Routes.login);
                  },
                  child: Text(
                    "Log in",
                    style: AppTextStyles.subtitle(
                      context,
                    ).copyWith(color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
