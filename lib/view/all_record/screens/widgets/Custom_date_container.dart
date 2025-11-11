import 'package:intl/intl.dart';

import '../../../../core/exports/ui_exports.dart';

// class CustomDateContainer extends StatelessWidget {
//   final String date;
//   const CustomDateContainer({super.key, required this.date});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       width: 55.w,
//       height: 60.h,
//       padding: EdgeInsets.symmetric(horizontal: 10.w),
//       decoration: BoxDecoration(
//         color: AppColor.primaryColor,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Text(
//         textAlign: TextAlign.center,
//         date,
//         style: AppTextStyles.CardTitle(context)
//             .copyWith(color: AppColor.whiteColor),
//         // style: TextStyle(
//         //   fontWeight: FontWeight.w500,
//         //   fontSize: 14,
//         //   color: AppColor.whiteColor,
//         // ),
//       ),
//     );
//   }
// }


class CustomDateContainer extends StatelessWidget {
  final String date;
  const CustomDateContainer({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat('dd MMM').format(dateTime).toUpperCase();
    }
    String formattedDate = formatDate(date);
    return Container(
      alignment: Alignment.center,
      width: 55.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        textAlign: TextAlign.center,
        formattedDate,
        style: AppTextStyles.CardTitle(context)
            .copyWith(color: AppColor.whiteColor),
        // style: TextStyle(
        //   fontWeight: FontWeight.w500,
        //   fontSize: 14,
        //   color: AppColor.whiteColor,
        // ),
      ),
    );
  }
}
