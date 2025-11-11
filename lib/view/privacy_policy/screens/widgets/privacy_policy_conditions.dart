import 'package:adv/core/exports/ui_exports.dart';

class PrivacyPolicyConditions extends StatelessWidget {
  final String text;
  const PrivacyPolicyConditions({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              width: 8.h,
              height: 8.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Text(
              text,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.subtitle(context).copyWith(
                color: AppColor.privacyPolicyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
