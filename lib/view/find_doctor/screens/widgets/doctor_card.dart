import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/find_doctor/controller/find_doctor_controller.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String experience;
  final String imagePath;
  final double ratingPercentage;
  final String patientStories;
  final String nextAvailableTime;
  final String nextAvailableDay;
  final VoidCallback onBookPressed;
  final bool showFavorite;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.experience,
    required this.imagePath,
    required this.ratingPercentage,
    required this.patientStories,
    required this.nextAvailableTime,
    required this.nextAvailableDay,
    required this.onBookPressed,
    this.showFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FindDoctorController>();

    return Align(
      alignment: Alignment.center,
      child:  SizedBox(
          width: 335.w,
          child: Card(
            color: AppColor.whiteColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          imagePath,
                          width: 92.w,
                          height: 92.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    name,
                                    style: AppTextStyles.doctorNameText(context),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Obx(() {
                                  final isFav = controller.isFavoriteDoctor(name);
                                  return GestureDetector(
                                    onTap: () => controller.toggleFavorite(name),
                                    child: Icon(
                                      isFav ? Icons.favorite : Icons.favorite_border,
                                      color: isFav ? Colors.red : AppColor.profileGreyColor,
                                      size: 17.sp,
                                    ),
                                  );
                                }),
                              ],
                            ),
                            Text(
                              specialization,
                              style: AppTextStyles.greenText(context),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              experience,
                              style: AppTextStyles.hintTextSize12(context),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Icon(Icons.circle, size: 10.sp, color: AppColor.primaryColor),
                                SizedBox(width: 4.w),
                                Text('${ratingPercentage.toStringAsFixed(0)}%', style: AppTextStyles.hintTextSize11(context)),
                                SizedBox(width: 12.w),
                                Icon(Icons.circle, size: 10.sp, color: AppColor.primaryColor),
                                SizedBox(width: 4.w),
                                Text(patientStories, style: AppTextStyles.hintTextSize11(context)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
        
                  SizedBox(height: 16.h),
        
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Next Available', style: AppTextStyles.greenText(context)),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text(nextAvailableTime, style: AppTextStyles.headlineSize12(context)),
                              SizedBox(width: 6.w),
                              Text(nextAvailableDay, style: AppTextStyles.hintTextSize12(context)),
                            ],
                          ),
                        ],
                      ),
                      AppButton(
                        buttonHeight: 34.h,
                        buttonText: "Book Now",
                        buttonWidth: 112.w,
                        borderRadius: 4.r,
                        textStyle: AppTextStyles.headlineSize12ColorWh(context),
                        onTap: onBookPressed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}