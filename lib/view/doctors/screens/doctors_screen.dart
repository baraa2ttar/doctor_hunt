import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/doctors/controller/doctor_controller.dart';
import 'package:adv/view/doctors/screens/widgets/doctor_card.dart';
import 'package:adv/view/doctors/screens/widgets/label_selector.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorsController controller = Get.find();
    double listHeight =
        context.screenHeight -
        context.ph(20 + 10 + 26 + 25 + 100) -
        context.pw(20) * 2 -
        kToolbarHeight;
    return AppBackground(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.pw(20)),
            child: AppTopBar(appBarText: "Doctors"),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.pw(20)),
            child: AppSearchBar(hintText: "Search"),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: context.pw(20)),
            child: LabelSelector(
              labels: ["All", "Dentist", "Cardiology", "Psychiatry","Dermatology","Neurology","Orthopedics","Pediatrics","Gynecology","Ophthalmology","Urology","Gastroenterology",],
            ),
          ),
          SizedBox(height: 25.h),
          
          // Professional fix: Wrap Obx with Expanded, and do not return Expanded from inside Obx
          Obx(() {
            if (controller.isLoading.value) {
              // Just show a progress indicator, no Expanded, no ListView
              return Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: CircularProgressIndicator(color: AppColor.primaryColor),
                ),
              );
            }
            if (controller.doctorsList.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    "No doctors found",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.greyColor,
                    ),
                  ),
                ),
              );
            }
            // Only show the list if there are doctors
            return SizedBox(
              height: listHeight,
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  context.pw(20),
                  0,
                  context.pw(20),
                  context.ph(120),
                ),
                itemCount: controller.doctorsList.length,
                itemBuilder: (context, index) {
                  final doctor = controller.doctorsList[index];
                  return DoctorCard(
                    image: doctor.image ?? AppAssets.img15,
                    title: doctor.name,
                    subTitle: "${doctor.degree} ${doctor.specializationName}",
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
              ),
            );
          }),
        ],
      ),
    );
  }
}
