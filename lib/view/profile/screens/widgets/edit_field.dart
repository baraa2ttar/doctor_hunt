import 'package:adv/core/exports/ui_exports.dart';

class EditFieldScreen extends StatelessWidget {
  final String title;
  final String question;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function(String) onSaved;

  const EditFieldScreen({
    super.key,
    required this.title,
    required this.controller,
    required this.onSaved,
    required this.question,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    return 
    AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      statusBarColor: AppColor.profileGreyColor, 
      statusBarIconBrightness: Brightness.light, 
    ),
    child: 
    Scaffold(
      backgroundColor: AppColor.profileGreyColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
      children: [
        GestureDetector(
          onTap: () async {
    bool success = await profileController.updateProfile();
    print("=======================> Update success? $success");
    if (success) {
      print("Navigating back");
      Get.toNamed(Routes.profile);
          }},
          child: Container(
            height: context.w(30).clamp(30.0, 50.0),
            width: context.w(30).clamp(30.0, 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColor.whiteColor,
            ),
            child: Center(child: Icon(Icons.arrow_back_ios_rounded, color: AppColor.darkGreyColor, size:context.sp(14).clamp(16.0, 24.0))),
          ),
        ),
          SizedBox(width: 22.w),
          Text(
          "Profile",
            style: AppTextStyles.doctorNameText(context).copyWith(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
      ],),
              SizedBox(height: context.h(180)),
              Text(
                question,
                style: AppTextStyles.buttonText(context).copyWith(
                  fontSize: context.sp(18),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: context.h(30)),

              AppTextFormField(
                keyboardType: keyboardType,
                contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
                isUnderlined: true,
                cursorColor: AppColor.whiteColor,
                controller: controller,
                hintText: "Enter $title",
                hintStyle: AppTextStyles.buttonText(
                  context,
                ).copyWith(fontSize: context.sp(14)),
                inputTextStyle: AppTextStyles.buttonText(
                  context,
                ).copyWith(fontSize: context.sp(20)),
                onChanged: (val) => onSaved(val),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    ));
  }
}
