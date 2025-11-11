import 'package:adv/core/exports/ui_exports.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      
      drawer:CustomDrawer(),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTopBar(appBarText: "Privacy policy"),
        SizedBox(height: context.h(22)),
        Text(AppStrings.privacyPolicyTitle, style: AppTextStyles.subtitle(context).copyWith(fontSize: context.sp(18), fontWeight: FontWeight.w700),),
        SizedBox(height: context.h(10)),
        Text(AppStrings.privacyPolicyMainContent, style: AppTextStyles.subtitle(context).copyWith(color: AppColor.privacyPolicyColor),),
        SizedBox(height: context.h(16)),
        PrivacyPolicyConditions(text: AppStrings.privacyPolicyFirstCondition),
        SizedBox(height: context.h(16)),
        PrivacyPolicyConditions(text: AppStrings.privacyPolicySecondCondition),
        SizedBox(height: context.h(16)),
        PrivacyPolicyConditions(text: AppStrings.privacyPolicyThirdCondition),
        SizedBox(height: context.h(16)),
        PrivacyPolicyConditions(text: AppStrings.privacyPolicyFourthCondition),
        SizedBox(height: context.h(16)),
        Text(AppStrings.privacyPolicyEnd, style: AppTextStyles.subtitle(context).copyWith(color: AppColor.privacyPolicyColor))
      ],
    ));
  }
}
