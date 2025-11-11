import 'package:adv/core/exports/ui_exports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();


    controller.fetchUserProfile(); 



      return  AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      statusBarColor: AppColor.primaryColor, 
      statusBarIconBrightness: Brightness.light, 
    ),
    child:  AppBackground(
      drawer:CustomDrawer(),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
            child: Column(
              children: [
                AppTopBar(
                  onTap: ()=> Get.offAllNamed(Routes.navbar),
                  appBarText: "Profile",
                  style: AppTextStyles.doctorNameText(context).copyWith(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30.h),

                Text(
                  AppStrings.profileSetUp,
                  style: AppTextStyles.buttonText(context).copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: context.sp(16),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppStrings.profileUpdate,
                  style: AppTextStyles.buttonText(
                    context,
                  ).copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        AppAssets.img12,
                        fit: BoxFit.cover,
                        width: 130.w,
                        height: 130.w,
                        alignment: Alignment.topCenter,
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          color: AppColor.cameraContainerColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(AppAssets.cameraIcon),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.pw(20)),
              child: Text(
                "Personal information",
                style: AppTextStyles.headline(
                  context,
                ).copyWith(fontSize: context.sp(18)),
              ),
            ),
          ),

          Obx(
            () =>
                ProfileField(
                  fieldName: "Name",
                  value: controller.name.value,
                  onTap: () {
                    controller.initializeEditFieldControllers();
                    Get.to(
                      () => EditFieldScreen(
                        question: "What is your name?",
                        title: "Name",
                        controller: controller.nameController,
                        onSaved: controller.updateName,
                      ),
                    );
                  },
                )),
              Obx(()=> ProfileField(
                  fieldName: "Contact Number",
                  value: controller.mobile.value,
                  onTap: () {
                    controller.initializeEditFieldControllers();
                    Get.to(
                      () => EditFieldScreen(
                        question: "What is your phone number?",
                        title: "Contact Number",
                        controller: controller.mobileController,
                        onSaved: controller.updateMobile,
                        keyboardType:   TextInputType.number,
                      ),
                    );
                  },
                  suffixIcon: SvgPicture.asset(AppAssets.penIcon),

          )),

          Obx(()=> ProfileField(
            fieldName: "Date of birth",
            value: controller.birth.value,
            onTap: () {
              controller.initializeEditFieldControllers();
              Get.to(
                    () => EditFieldScreen(
                      question: "What is your date of birth?",
                  title: "Date of birth",
                  controller: controller.birthController,
                  onSaved: controller.updateBirth,
                ),
              );
            },
            suffixIcon: SvgPicture.asset(AppAssets.penIcon),

          )),

          Obx(
                  () =>
                  ProfileField(
                    fieldName: "Location",
                    value: controller.location.value,
                    onTap: () {
                      controller.initializeEditFieldControllers();
                      Get.to(
                            () => EditFieldScreen(
                              question: "What is your location?",
                          title: "Location",
                          controller: controller.locationController,
                          onSaved: controller.updateLocation,
                        ),
                      );
                    },
                  )),

          SizedBox(height: 30.h),
          AppButton(
            buttonHeight: 54.h,
            buttonWidth: context.w(295),
            buttonText: "Continue",
            textStyle: AppTextStyles.buttonText(
              context,
            ).copyWith(fontSize: context.sp(18)),
            borderRadius: 12.r,
            onTap: () {},
          ),
        ],
      ),
      ));
  }
}
