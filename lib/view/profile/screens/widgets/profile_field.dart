import 'package:adv/core/exports/ui_exports.dart';

class ProfileField extends StatelessWidget {
  final String fieldName;
  final String value;
  final VoidCallback onTap;
  final Widget? suffixIcon;

  const ProfileField({
    super.key,
    required this.fieldName,
    required this.value,
    required this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.pw(20), vertical: context.ph(6)),
        child: Container(
          padding:
              EdgeInsets.only(left: 18.w, top: 8.h, bottom: 8.h, right: 18.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fieldName,
                      style: AppTextStyles.greenText(context).copyWith(
                        fontSize: context.sp(12),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      value,
                      style: AppTextStyles.hintText(context),
                    ),
                  ],
                ),
              ),
              if (suffixIcon != null) suffixIcon!,
            ],
          ),
        ),
      ),
    );
  }
}
