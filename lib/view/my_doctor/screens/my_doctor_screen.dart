import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/my_doctor/controller/my-doctor-controller.dart';
import 'package:adv/view/my_doctor/screens/widgets/doctor-card.dart';

class MyDoctorsScreen extends StatelessWidget {
  
  final MyDoctorController controller = Get.put(MyDoctorController());

  MyDoctorsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer:CustomDrawer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                const SizedBox(width: 19),
                Text(
                  'My Doctors',
                  style: AppTextStyles.doctorNameText(context),
                ),
              ],
            ),
          const SizedBox(height: 16),
          Align(
              alignment: Alignment.center,
              child: AppSearchBar(
                controller: controller.searchController,
                // onChanged: controller.filterDoctors,
                // onClear: controller.clearSearch,
                fillColor: AppColor.whiteColor,
              ),
            ),
          
          const SizedBox(height: 12),
        Obx(() {
          if (controller.isLoading.value) {
    return Center(
      child: CircularProgressIndicator(color: AppColor.primaryColor,),
    );
  }


            final doctors = controller.combinedDoctors;


            if (doctors.isEmpty) {
    return const Center(child: Text("No doctors found."));
  }
              return ListView.separated(
                shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
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
                      print('Book Now pressed for ${doctor['name']}');
                    },
                    onDelete: () {
  final doctorId = doctor['id'];
  controller.deleteDoctorById(doctorId);
},
                    controller: controller,
                  );
                },
              );
            }),
        
        ],
      ),
    );
  }
}