import 'package:adv/core/exports/ui_exports.dart';

class BottomAvailabilitySection extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const BottomAvailabilitySection({
    super.key,
    required this.label,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.subtitle(context).copyWith(
              color: backgroundColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
