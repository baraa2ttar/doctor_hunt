import 'package:adv/view/doctor_appointment/controller/doctor_appointment_controller.dart';
import 'package:adv/view/doctor_appointment/screens/widgets/thank_you_dialog.dart';

import '../../../../core/exports/main_exports.dart';
import '../../../../widgets/app_button.dart';

class ConfirmBottomSheet extends StatelessWidget {
  const ConfirmBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorAppointmentController>(builder: (controller) {
      return Column(
        children: [
          Row(children: [
            Text('Available Time',
                style: TextStyle(
                    color: AppColor.titleColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rubik')),
          ]),
          SizedBox(height: 20.h),
          SizedBox(
            height: 60,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              scrollDirection: Axis.horizontal,
              itemCount: timeList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 9.w);
              },
              itemBuilder: (BuildContext context, int index) {
                final isSelected = index == controller.selectedTimeIndex;
                return GestureDetector(
                  onTap: () => controller.selectTime(index),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColor.primaryColor
                          : AppColor.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          timeList[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColor.whiteColor
                                : AppColor.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Am',
                          style: TextStyle(
                            color: isSelected
                                ? AppColor.whiteColor
                                : AppColor.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Row(children: [
            Text('Reminder Me Before',
                style: TextStyle(
                    color: AppColor.titleColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rubik')),
          ]),
          SizedBox(height: 20.h),
          SizedBox(
            height: 60,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              scrollDirection: Axis.horizontal,
              itemCount: minList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 9.w);
              },
              itemBuilder: (BuildContext context, int index) {
                final isSelected = index == controller.selectedReminderIndex;
                return GestureDetector(
                  onTap: () => controller.selectReminder(index),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColor.primaryColor
                          : AppColor.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          minList[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColor.whiteColor
                                : AppColor.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Minit',
                          style: TextStyle(
                            color: isSelected
                                ? AppColor.whiteColor
                                : AppColor.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          AppButton(
            borderRadius: 6.r,
            buttonWidth: 295.w,
            buttonHeight: 54.h,
            buttonText: 'Confirm',
            textStyle: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik'),
            onTap: () => controller.storeAppointment(),
          )
        ],
      );
    });
  }
}

List<String> timeList = [
  '10:00',
  '12:00',
  '02:00',
  '03:00',
  '04:00',
];
List<String> minList = [
  '30',
  '40',
  '25',
  '10',
  '35',
];
