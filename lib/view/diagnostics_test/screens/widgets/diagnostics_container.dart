import 'package:adv/core/exports/ui_exports.dart';

class DiagnosticsContainer extends StatelessWidget {
  final Color colorStart;
  final Color colorEnd;
  final String svgIcon;
  final String text;

  const DiagnosticsContainer({
    super.key,
    required this.colorStart,
    required this.colorEnd,
    required this.svgIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: LinearGradient(
                colors: [colorStart, colorEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SvgPicture.asset(svgIcon),
          ),
          SizedBox(width: 6.w),
          Text(text,
              style: AppTextStyles.diagnosticsSection(context)
                  .copyWith(fontSize: 13.sp)),
        ],
      ),
    );
  }
}
