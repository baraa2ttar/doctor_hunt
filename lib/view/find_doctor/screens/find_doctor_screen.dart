import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/find_doctor/controller/find_doctor_controller.dart';
import 'package:adv/view/find_doctor/screens/widgets/doctor_card.dart';

class FindDoctorScreen extends StatelessWidget {
  FindDoctorScreen({super.key});

  final controller = Get.put(FindDoctorController());

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer: CustomDrawer(),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back_ios_new, size: 13.sp),
                    onPressed: () => Get.back(),
                  ),
                ),
                SizedBox(width: 19.w),
                Text('Find Doctors',
                    style: AppTextStyles.doctorNameText(context)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppSearchBar(
              controller: controller.searchController,
              onChanged: controller.filterDoctors,
              onClear: controller.clearSearch,
              fillColor: AppColor.whiteColor,
            ),
          ),
          SizedBox(height: 12.h),
        
Obx(() {
            if (controller.isLoading.value) {
              return Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: CircularProgressIndicator(color: AppColor.primaryColor),
                ),
              );
            }
            // Only show the list if there are doctors
        


            final doctors = controller.filteredList;
            return ListView.separated(
              itemCount: doctors.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorCard(
                  name: doctor['name'],
                  specialization: doctor['specialization'],
                  experience: doctor['experience'],
                  imagePath: doctor['image'],
                  ratingPercentage: doctor['rating'],
                  patientStories: doctor['stories'],
                  nextAvailableTime: doctor['time'],
                  nextAvailableDay: doctor['day'],
                  onBookPressed: () {
                    Get.toNamed(Routes.selectTime);
                  },
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
