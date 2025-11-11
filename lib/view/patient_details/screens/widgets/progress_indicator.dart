import 'package:adv/core/exports/ui_exports.dart';

// class StepsProgressIndicator extends StatelessWidget {
//   const StepsProgressIndicator({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final PatientDetailsController controller = Get.find();
//     return Column(
//       children: [
//         Obx(() => Container(
//           padding: EdgeInsets.all(9.sp),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14.r),
//             color: AppColor.whiteColor,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity( 0.2),
//                 blurRadius: 6,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 " Step ",
//                 style: AppTextStyles.titleText(context)
//                     .copyWith(fontSize: context.sp(14)),
//               ),
//               Text("${controller.currentStep.value}/${controller.totalSteps}", style: AppTextStyles.titleText(context)
//                   .copyWith(fontSize: context.sp(14)), ),
//               SizedBox(width: 6.w),
//               Expanded(
//                 child: LinearPercentIndicator(
//                   lineHeight: 8.0.h,
//                   percent: controller.progress,
//                   backgroundColor: AppColor.shadowGreenColor,
//                   progressColor: AppColor.primaryColor,
//                   barRadius: const Radius.circular(8),
//                   animation: true,
//                   animationDuration: 300,
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ],
//     );
//   }
// }

class StepsProgressIndicator extends StatelessWidget {
  const StepsProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final PatientDetailsController controller = Get.find();

    return Obx(() => Container(
          padding: EdgeInsets.all(9.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Step ",
                style: AppTextStyles.titleText(context)
                    .copyWith(fontSize: context.sp(14)),
              ),
              Text(
                "${controller.completedSteps.value}/${controller.totalSteps}",
                style: AppTextStyles.titleText(context)
                    .copyWith(fontSize: context.sp(14)),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: LinearPercentIndicator(
                  lineHeight: 8.0.h,
                  percent: controller.progress,
                  backgroundColor: AppColor.shadowGreenColor,
                  progressColor: AppColor.primaryColor,
                  barRadius: const Radius.circular(8),
                  animation: true,
                  animationDuration: 300,
                ),
              ),
            ],
          ),
        ));
  }
}
