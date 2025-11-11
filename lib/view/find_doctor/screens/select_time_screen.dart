import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/find_doctor/controller/find_doctor_controller.dart';
import 'package:adv/view/find_doctor/screens/widgets/book_time_selector.dart';
import 'package:adv/view/find_doctor/screens/widgets/list_tile.dart';

class SelectTimeScreen extends StatelessWidget {
  const SelectTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer: CustomDrawer(),
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const AppTopBar(appBarText: 'Select Time'),
          SizedBox(height: 24.h),
          GetBuilder<FindDoctorController>(
            init: FindDoctorController(),
            builder: (ctrl) {
              return DoctorListTile(
                doctorName: 'Dr. Shruti Kedia',
                clinicName: 'Specialist Cardiologist',
                imagePath: AppAssets.img1,
                rate: 4,
                isFavorite: true,
                onTap: () => ctrl.favoriteChange,
              );
            },
          ),
          SizedBox(height: 24.h),
          GetBuilder<FindDoctorController>(
            builder: (controller) {
              return BookTimeSelector(
                itemCount: AppConstants.bookingDates.length,
                selectedIndex: controller.dateSelectedIndex,
                onTap: controller.selectDate,
              );
            },
          ),
          SizedBox(height: 24.h),
          Center(
            child: Text(
              'Today, 23 Feb',
              style: AppTextStyles.subtitle(context).copyWith(
                fontSize: 14.sp,
                color: AppColor.darkColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              'No slots available',
              style: AppTextStyles.subtitle(context).copyWith(
                fontSize: 14.sp,
                color: AppColor.lightGreyColor,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          AppButton(
              buttonHeight: 50.h,
              buttonText: 'Next available on Wed, 24 Feb',
              textStyle: AppTextStyles.subtitle(context).copyWith(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onTap: () => Get.toNamed(Routes.availableTime),
              borderRadius: 6.r)
          // GestureDetector(
          //   onTap:()=> Get.toNamed(Routes.availableTime),
          //   child: Container(
          //     width: double.infinity,
          //     height: 50.h,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       color: AppColor.primaryColor,
          //       borderRadius: BorderRadius.circular(10.r),
          //     ),
          //     child: Text(
          //       'Next available on Wed, 24 Feb',
          //       style: AppTextStyles.subtitle(context).copyWith(
          //         color: Colors.white,
          //         fontSize: 14.sp,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ),
          // ),
          ,
          SizedBox(height: 16.h),
          Center(
            child: Text(
              'OR',
              style: AppTextStyles.subtitle(context).copyWith(
                fontSize: 13.sp,
                color: AppColor.greyColor,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          AppButton(
              border: Border.all(
                  color: AppColor.primaryColor.withOpacity(0.5), width: 1),
              backgroundColor: Colors.transparent,
              buttonHeight: 50.h,
              buttonText: 'Contact Clinic',
              textStyle: AppTextStyles.subtitle(context).copyWith(
                color: AppColor.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onTap: () => Get.toNamed(Routes.availableTime),
              borderRadius: 6.r)
          // Container(
          //   width: double.infinity,
          //   height: 50.h,
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     border: Border.all(color: AppColor.primaryColor, width: 1.2),
          //     borderRadius: BorderRadius.circular(10.r),
          //     color: Colors.transparent,
          //   ),
          //   child: Text(
          //     'Contact Clinic',
          //     style: AppTextStyles.subtitle(context).copyWith(
          //       fontSize: 14.sp,
          //       color: AppColor.primaryColor,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          ,
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
