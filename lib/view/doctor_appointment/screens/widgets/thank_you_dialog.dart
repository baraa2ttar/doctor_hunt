import 'package:adv/core/exports/ui_exports.dart';

class ThankYouDialog extends StatelessWidget {
  const ThankYouDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Align(
          alignment: Alignment.center,
          child: Material(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              width: 335.w,
              height: 520.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  SizedBox(height: 26.h),
                  Container(
                    alignment: Alignment.center,
                    width: 156.r,
                    height: 156.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(78),
                      color: AppColor.primaryColor.withOpacity(0.08),
                    ),
                    child: SvgPicture.asset(AppAssets.likeIcon),
                  ),
                  SizedBox(height: 12.h),
                  Text('Thank You !',
                      style: AppTextStyles.headline(context)
                          .copyWith(fontSize: 38.sp)),
                  Text('Your Appointment Successful',
                      style: AppTextStyles.headline(context).copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColor.darkGreyColor)),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 265.w,
                    height: 67.h,
                    child: Text(
                      '''You booked an appointment with Dr. 
Pediatrician Purpieson on February 21,
at 02:00 PM''',
                      style: AppTextStyles.headline(context).copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.darkGreyColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 29.h),
                  AppButton(
                      onTap: () {
                        Get.back();
                      },
                    borderRadius: 6.r,
                      buttonWidth: 295.w,
                      buttonHeight: 54.h,
                      buttonText: 'Done',
                      textStyle: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rubik'),
                     ),
                  const SizedBox(height: 18),
                  Text('Edit your appointment',
                      style: AppTextStyles.subtitle(context).copyWith()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
