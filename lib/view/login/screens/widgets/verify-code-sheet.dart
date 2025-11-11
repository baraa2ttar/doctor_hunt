import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/login/screens/widgets/reset-password.dart';
import 'package:flutter/services.dart';

class VerifyCodeSheet extends StatelessWidget {
  const VerifyCodeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.ph(10),
          // right: context.pw(24),
          // left: context.pw(24),
        ),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// الخط العلوي
                Container(
                  width: context.w(130),
                  height: context.h(5),
                  margin: EdgeInsets.only(bottom: context.ph(20)),
                  decoration: BoxDecoration(
                    color: AppColor.greyColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: 28.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.verifyCodetitle,
                    style: AppTextStyles.headline24(context),
                  ),
                ),
                SizedBox(height: context.ph(12)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.verifyCodeSubtitle,
                    style: AppTextStyles.subtitle(context),
                  ),
                ),
                SizedBox(height: context.ph(36)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    4,
                    (index) => _buildCodeField(context),
                  ),
                ),
                SizedBox(height: context.ph(30)),

                AppButton(
                  buttonHeight: 54.h,
                  buttonWidth: 295.w,

                  textStyle: AppTextStyles.buttonText(context),
                  borderRadius: 12.r,
                  buttonText: "Continue",
                  onTap: () {
                    Get.back();
                    CustomBottomSheet.show(
                      isScrollControlled: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      child: const ResetPassword(),
                    );
                  },
                ),
                SizedBox(height: context.ph(17)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCodeField(BuildContext context) {
  return SizedBox(
    width: 54,
    height: 54,
    child: TextField(
      textAlign: TextAlign.center, // أفقيًا بالنص
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.number,
      maxLength: 1,
      style: AppTextStyles.greenText700(context),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        counterText: "",
        isCollapsed: false,
        contentPadding: EdgeInsets.zero,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.greyColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.greyColor, width: 1),
        ),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
