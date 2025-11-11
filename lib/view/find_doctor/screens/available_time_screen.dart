import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/find_doctor/screens/widgets/book_time_selector.dart';
import 'package:adv/view/find_doctor/screens/widgets/booking_time_grid.dart';
import 'package:adv/view/find_doctor/screens/widgets/custom_list_tile.dart';

import '../controller/find_doctor_controller.dart';

class AvailableTimeScreen extends StatelessWidget {
  const AvailableTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer: CustomDrawer(),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const AppTopBar(appBarText: 'Select Time'),
          SizedBox(height: 34.h),
          GetBuilder(
            init: FindDoctorController(),
            builder: (controller) {
              return Column(
                children: [
                  CustomListTile(
                    favorateSize: 18,
                    imageRadius: 4.r,
                    favorateRightPadding: 15,
                    favorateTopPadding: 15,
                    starSize: 10,
                    titleFontSize: 16,
                    subTitleFontSize: 11,
                    imageHeight: 68.h,
                    imageWidth: 72.w,
                    leftPading: 10.w,
                    topPading: 10.h,
                    height: 88.h,
                    width: 335.w,
                    onTap: controller.favorateChange,
                    clinicName: 'Specialist Cardiologist ',
                    doctorName: 'Dr. Shruti Kedia',
                    imagePath: AppAssets.img1,
                    rate: 4,
                    isFavorite: controller.isFavorite,
                    heightSpaceAboveStars: 6.h,
                  ),
                  SizedBox(height: 24.h),
                  BookTimeSelector(
                      itemCount: AppConstants.bookingDates.length,
                      selectedIndex: controller.dateSelectedIndex,
                      onTap: controller.selectDate),
                  SizedBox(height: 20.h),
                  Text(AppConstants.bookingDates[controller.dateSelectedIndex],
                      style: AppTextStyles.title(context).copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkColor)),
                  SizedBox(height: 35.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Afternoon ${AppConstants.timeSlotsAfternoon.length} slots',
                        style: AppTextStyles.title(context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkColor)),
                  ),
                  SizedBox(height: 16.h),
                  BookingTimeGrid(
                      onTap: controller.changeSelectTimeAfternoon,
                      selectedIndex: controller.selectTimeAfternoon,
                      timeSlots: AppConstants.timeSlotsAfternoon),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Evening ${AppConstants.timeSlotsEvening.length} slots',
                        style: AppTextStyles.title(context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkColor)),
                  ),
                  SizedBox(height: 16.h),
                  BookingTimeGrid(
                      onTap: controller.changeSelectTimeEavening,
                      selectedIndex: controller.selectTimeEavening,
                      timeSlots: AppConstants.timeSlotsEvening),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
