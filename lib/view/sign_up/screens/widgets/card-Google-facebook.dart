
import 'package:flutter/material.dart';
//
// class CardGoogleFacebook extends StatelessWidget {
//   final String imagePath; // مسار الصورة
//   final String label;     // النص المعروض بجانب الصورة
//
//   const CardGoogleFacebook({
//     super.key,
//     required this.imagePath,
//     required this.label,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       height: 54,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             imagePath,
//             width: 18.17,
//             height: 18.17,
//           ),
//           SizedBox(width: 10),
//           Text(
//             label,
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardGoogleFacebook extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final TextStyle? textStyle;

  const CardGoogleFacebook({
    super.key,
    required this.imagePath,
    required this.label,
    this.onTap,
    this.width = 160,
    this.height = 54,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 18.w,
              height: 18.w,
            ),
            SizedBox(width: 10.w),
            Text(
              label,
              style: textStyle ?? TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
