import 'package:adv/core/exports/main_exports.dart';
import 'package:adv/view/doctor_appointment/controller/doctor_appointment_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorAppointmentController>(
      builder: (controller) {
        final month = controller.selectedDate.month;
        final year = controller.selectedDate.year;

        return Column(
          children: [
            Container(
              height: 52.h,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${getMonthName(month)} $year',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left,
                            color: Colors.white, size: 30),
                        onPressed: () {
                          final prevMonth = DateTime(
                            controller.selectedDate.year,
                            controller.selectedDate.month - 1,
                          );
                          controller.setSelectedDate(prevMonth);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right,
                            size: 30, color: Colors.white),
                        onPressed: () {
                          final nextMonth = DateTime(
                            controller.selectedDate.year,
                            controller.selectedDate.month + 1,
                          );
                          controller.setSelectedDate(nextMonth);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: TableCalendar(
                rowHeight: 42.h,
                daysOfWeekHeight: 38.h,
                headerVisible: false,
                firstDay: DateTime.utc(2000),
                lastDay: DateTime.utc(2100),
                focusedDay: controller.selectedDate,
                selectedDayPredicate: (day) =>
                    isSameDay(controller.selectedDate, day),
                onDaySelected: (selectedDay, focusedDay) {
                  controller.setSelectedDate(selectedDay);
                  controller.openBottomSheet();
                },
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (date, locale) {
                    switch (date.weekday) {
                      case 1:
                        return 'Tu';
                      case 2:
                        return 'We';
                      case 3:
                        return 'Th';
                      case 4:
                        return 'Fr';
                      case 5:
                        return 'Sa';
                      case 6:
                        return 'Su';
                      case 7:
                        return 'Mo';
                      default:
                        return '';
                    }
                  },
                  weekdayStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(width: 1, color: Color(0xffEDEDED)))),
                  weekendStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                ),
                calendarStyle: CalendarStyle(
                  todayTextStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                  isTodayHighlighted: false,
                  selectedDecoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: AppColor.whiteColor),
                  defaultTextStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                  weekendTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                  outsideDaysVisible: false,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

String getMonthName(int monthNumber) {
  const List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  if (monthNumber < 1 || monthNumber > 12) return 'Invalid month';
  return monthNames[monthNumber - 1];
}

