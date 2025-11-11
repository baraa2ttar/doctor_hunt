import '../../../../core/exports/ui_exports.dart';

// class CustomNewContainer extends StatelessWidget {
//   const CustomNewContainer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 22,
//       width: 55,
//       decoration: BoxDecoration(
//         color: AppColor.lightColor,
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Center(
//         child: Text(
//           'NEW',
//           style: TextStyle(
//               color: Colors.green,
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }
// }

class CustomNewContainer extends StatelessWidget {
  const CustomNewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 55,
      decoration: BoxDecoration(
        color: AppColor.lightColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          'NEW',
          style: TextStyle(
              color: Colors.green,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
