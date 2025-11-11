import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/drawer/controller/drawer-controller.dart';
import 'package:adv/view/drawer/screens/widgets/logout_show_dialog.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final DrawerrController controller = Get.put(DrawerrController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // profileController.fetchUserProfile();
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColor.profileGreyColor,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Drawer(
          backgroundColor: AppColor.profileGreyColor,
          width: context.widthTransformer(reducedBy: 0),
          child: Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 150.w,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Positioned(
                          top: 140.h,
                          bottom: 140.h,
                          child: SizedBox(
                            height: 531.h,
                            child: Image.asset(
                              AppAssets.drawer,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      width: 335.w,
                      padding: EdgeInsets.only(top: 46.h, right: 20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.profile),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                AppAssets.profile,
                                width: 44,
                                height: 44,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),

                            Expanded(
  child: Obx(() {
    if (profileController.isLoading.value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 80.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profileController.name.value,
            style: AppTextStyles.nameText(context),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Icon(
                  Icons.phone_outlined,
                  size: 16,
                  color: AppColor.whiteColor,
                ),
              ),
              SizedBox(width: 8),
              Text(
                profileController.mobile.value,
                style: AppTextStyles.subtitleS12ColorWhite(context),
              ),
            ],
          ),
        ],
      );
    }
  }),
),

                            IconButton(
                              icon: CircleAvatar(
                                backgroundColor: AppColor.redColor,
                                radius: 16,
                                child: Icon(
                                  Icons.close,
                                  color: AppColor.whiteColor,
                                  size: 18,
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 52.h),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile1, title: 'My Doctors'),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile2,
                        title: 'Medical Records'),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile3, title: 'Payments'),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile4,
                        title: 'Medicine Orders'),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile5, title: 'Test Bookings'),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile6,
                        title: 'Privacy & Policy'),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile7, title: 'Help Center'),
                    _buildDrawerItem(context,
                        imageAsset: AppAssets.profile8, title: 'Settings'),
                    SizedBox(height: 60.h),
                    _buildDrawerItem(
                      imageAsset: AppAssets.logoutIcon,
                      context,
                      title: 'Logout',
                      textStyle: AppTextStyles.headlineSize20ColorWh(context),
                      color: AppColor.redColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    IconData? icon,
    String? imageAsset,
    required String title,
    Color color = Colors.black,
    TextStyle? textStyle,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedItem.value == title;

      return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                controller.selectItem(title);

                if (title == 'Logout') {
                  Get.dialog(
                    LogoutShowDialog(
                      onConfirm: ()  async {
    Get.back(); 
    await controller.logout();
},
                    ),
                    barrierDismissible: true,
                    barrierColor: Colors.transparent,
                  );
                  return;
                }

                String? routeName;
                switch (title) {
                  case 'My Doctors':
                    routeName = Routes.myDoctor;
                    break;
                  case 'Medical Records':
                    routeName = Routes.medicalRecord;
                    break;
                  case 'Payments':
                    routeName = Routes.emptyDetails;
                    break;
                  case 'Medicine Orders':
                    routeName = Routes.medicineOrder;
                    break;
                  case 'Test Bookings':
                    routeName = Routes.diagnosticsInfo;
                    break;
                  case 'Privacy & Policy':
                    routeName = Routes.privacyPolicy;
                    break;
                  case 'Help Center':
                    routeName = Routes.helpCenter;
                    break;
                  case 'Settings':
                    routeName = Routes.settings;
                    break;
                }

                Navigator.of(context).pop();
                await Future.delayed(Duration(milliseconds: 200));
                if (routeName != null) {
                  Get.toNamed(routeName);
                }
              },
              splashColor: Colors.white.withOpacity(0.1),
              highlightColor: Colors.white.withOpacity(0.05),
              child: Container(
                width: 212.w,
                height: 61.h,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: [
                    imageAsset != null
                        ? Image.asset(imageAsset, width: 19, fit: BoxFit.cover)
                        : (icon != null
                            ? Icon(icon, color: AppColor.whiteColor)
                            : SizedBox(width: 19)),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        title,
                        style: textStyle ??
                            AppTextStyles.subtitleColorWSize16(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: AppColor.whiteColor, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
