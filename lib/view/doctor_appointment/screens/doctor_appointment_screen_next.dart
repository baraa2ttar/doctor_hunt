import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/doctor_appointment/controller/doctor_appointment_controller.dart';
import 'package:adv/view/doctor_appointment/screens/widgets/custom_calendar.dart';

class DoctorAppointmentScreenNext extends StatelessWidget {
  const DoctorAppointmentScreenNext({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        children: [
          const AppTopBar(appBarText: "Appointment"),
          SizedBox(height: 34.h),
          GetBuilder(
            init: DoctorAppointmentController(),
            builder: (controller) {
              return Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.blackColor.withOpacity(0.08),
                              blurRadius: 20.r,
                            )
                          ]),
                      child: const CustomCalendar()),
                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

