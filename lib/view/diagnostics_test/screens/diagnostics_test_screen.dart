import 'package:adv/core/exports/ui_exports.dart';

class DiagnosticsTestScreen extends StatelessWidget {
  const DiagnosticsTestScreen({super.key});

  void _showForgotPasswordSheet(BuildContext context) {
    CustomBottomSheet.show(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot Password',
            style: AppTextStyles.doctorNameText(context),
          ),
          const SizedBox(height: 16),
          AppTextFormField(hintText: 'Enter your email'),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              Get.back();
              Get.snackbar('Success', 'Reset link sent!');
            },
            buttonText: 'Submit',
            buttonHeight: 50,
            textStyle: AppTextStyles.buttonText(context),
          ),
        ],
      ), ShadowIsTrue: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        children: [
          AppTopBar(
            onSearchTap: () {},
            appBarText: "Select Item",
          ),
          SizedBox(height: context.h(20)),

          AppTextFormField(hintText: "Hello"),

          SizedBox(height: context.h(20)),

          AppSearchBar(
            // controller: myController,
            // onChanged: (value) {
            //   // Do search
            // },
            // onClear: () {
            //   myController.clear();
            // },
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
          ),



          SizedBox(height: context.h(20)),

          AppButton(
            onTap: () {},
            buttonText: "Get Started",
            buttonHeight: 54,
            textStyle: AppTextStyles.buttonText(context),
          ),


          SizedBox(height: context.h(20)),
          TextButton(
            onPressed: () => _showForgotPasswordSheet(context),
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.buttonText(context)?.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
