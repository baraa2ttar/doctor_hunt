import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/login/screens/widgets/forget-password-sheet.dart';
import 'package:adv/view/login/controller/login-controller.dart';
import 'package:adv/view/sign_up/screens/widgets/card-Google-facebook.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.welcomeLogin,
            style: AppTextStyles.headline24(context),
          ),
          Text(
            AppStrings.welcomeLoginSubtitle,
            style: AppTextStyles.subtitle(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.ph(78)),
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
          SizedBox(height: context.ph(37)),
          AppTextFormField(
            height: 54.h,
            hintText: "Email",
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) {}, // أو وظيفتك لو فيه تحقق
            suffixIcon: Builder(
              builder:
                  (context) => IconButton(
                    icon: Icon(Icons.check, color: AppColor.darkGreyColor),
                    onPressed: () {
                      FocusScope.of(context).unfocus(); // ✅ ينزل الكيبورد
                    },
                  ),
            ),
          ),

          SizedBox(height: context.ph(18)),

          Obx(
            () => AppTextFormField(
              height: 54.h,
              hintText: "Password",
              controller: controller.passwordController,
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
          SizedBox(height: context.ph(32)),
          AppButton(
            buttonWidth: 295.w,
            buttonText: "Login",
            borderRadius: 12.r,
            buttonHeight: 54.h,
            textStyle: AppTextStyles.buttonText(context),
            onTap: () => controller.loginUser(),
          ),
          SizedBox(height: context.ph(19)),
          GestureDetector(
            onTap: () {
              CustomBottomSheet.show(
                isScrollControlled: true,
                barrierColor: Colors.black.withOpacity(0.5),
                child: const ForgotPasswordSheet(),
              );
            },
            child: Text(
              "Forgot Password",
              style: AppTextStyles.subtitle(
                context,
              ).copyWith(color: AppColor.primaryColor),
            ),
          ),
          SizedBox(height: context.ph(123)),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.signUp),
            child: Text(
              "Don’t have an account? Join us",
              style: AppTextStyles.subtitle(
                context,
              ).copyWith(color: AppColor.primaryColor),
            ),
          ),
          // SizedBox(height: context.ph(46)),
        ],
      ),
    );
  }
}
