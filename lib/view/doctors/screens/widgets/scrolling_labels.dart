import 'package:adv/core/exports/ui_exports.dart';

class ScrollingLabels extends StatelessWidget {
  final String labelName;
  final bool isSelected;
  final VoidCallback onTap;

  const ScrollingLabels({
    super.key,
    required this.labelName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : AppColor.labelColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Text(
          labelName,
          style: AppTextStyles.buttonText(context).copyWith(
            color: isSelected ? Colors.white : AppColor.primaryColor,
            fontWeight: isSelected? FontWeight.w500 : FontWeight.w300
          ),
        ),
      ),
    );
  }
}

