import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/settings/controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find();
    return AppBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTopBar(appBarText: "Settings"),
          SizedBox(height: 28.h),
          Text(
            "Account settings",
            style: AppTextStyles.doctorNameText(
              context,
            ).copyWith(color: AppColor.darkGreyColor),
          ),
          SizedBox(height: 10.h),

          SettingsListTile(
            settingsName: "Change Password",
            leading: SettingsIcon(
              color: AppColor.settingsRedColor,
              svgIcon: AppAssets.lockIcon,
            ),
            trailing: SvgPicture.asset(
              AppAssets.nextIcon,
              colorFilter: ColorFilter.mode(
                AppColor.navbarIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),

          Divider(color: AppColor.dividerColor),

          SettingsListTile(
            settingsName: "Notifications",
            leading: SettingsIcon(
              color: AppColor.settingsGreenColor,
              svgIcon: AppAssets.notificationIcon,
            ),
            trailing: SvgPicture.asset(
              AppAssets.nextIcon,
              colorFilter: ColorFilter.mode(
                AppColor.navbarIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),

          Divider(color: AppColor.dividerColor),

          SettingsListTile(
            settingsName: "Statistics",
            leading: SettingsIcon(
              color: AppColor.settingsBlueColor,
              svgIcon: AppAssets.statisticsIcon,
            ),
            trailing: SvgPicture.asset(
              AppAssets.nextIcon,
              colorFilter: ColorFilter.mode(
                AppColor.navbarIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),

          Divider(color: AppColor.dividerColor),

          SettingsListTile(
            settingsName: "About us",
            leading: SettingsIcon(
              color: AppColor.settingsOrangeColor,
              svgIcon: AppAssets.usIcon,
            ),
            trailing: SvgPicture.asset(
              AppAssets.nextIcon,
              colorFilter: ColorFilter.mode(
                AppColor.navbarIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),

          Divider(color: AppColor.dividerColor),
          SizedBox(height: 16.h),
          Text(
            "More options",
            style: AppTextStyles.doctorNameText(
              context,
            ).copyWith(color: AppColor.darkGreyColor),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => SettingsListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              settingsName: "Text messages",
              trailing: ToggleBubbleSwitch(
                width: 42.w,
                height: 26.h,
                activeColor: AppColor.primaryColor,
                inactiveColor: AppColor.greyColor,
                bubbleColor: Colors.white,
                onTap: controller.toggleFirstIcon,
                toggled: controller.isFirstIconToggled.value,
              ),
            ),
          ),

          Divider(color: AppColor.dividerColor),
          Obx(
            () => SettingsListTile(
              settingsName: "Phone calls",
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              trailing: ToggleBubbleSwitch(
                width: 42.w,
                height: 26.h,
                activeColor: AppColor.primaryColor,
                inactiveColor: AppColor.greyColor,
                bubbleColor: Colors.white,
                onTap: controller.toggleSecondIcon,
                toggled: controller.isSecondIconToggled.value,
              ),
            ),
          ),

          Divider(color: AppColor.dividerColor),

          SettingsListTile(
            settingsName: "Languages",
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            trailing: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: AppTextStyles.hintText(
                      context,
                    ).copyWith(fontSize: context.sp(13)),
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    AppAssets.nextIcon,
                    colorFilter: ColorFilter.mode(
                      AppColor.navbarIconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: AppColor.dividerColor),

          SettingsListTile(
            settingsName: "Currency",
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            trailing: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$-USD",
                    style: AppTextStyles.hintText(
                      context,
                    ).copyWith(fontSize: context.sp(13)),
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    AppAssets.nextIcon,
                    colorFilter: ColorFilter.mode(
                      AppColor.navbarIconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: AppColor.dividerColor),

          SettingsListTile(
            settingsName: "Linked accounts",
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            trailing: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Facebook, Google",
                    style: AppTextStyles.hintText(
                      context,
                    ).copyWith(fontSize: context.sp(13)),
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    AppAssets.nextIcon,
                    colorFilter: ColorFilter.mode(
                      AppColor.navbarIconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: AppColor.dividerColor),
        ],
      ),
    );
  }
}
