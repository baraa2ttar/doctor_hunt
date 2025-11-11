import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/doctor_details/controller/doctor_details_controller.dart';
import 'package:adv/view/find_doctor/screens/widgets/custom_list_tile.dart';
import 'package:adv/view/find_doctor/screens/widgets/select_book_time.dart';

import '../../../widgets/app_map.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer: CustomDrawer(),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          AppTopBar(
              onSearchTap: () => Get.toNamed(Routes.findDoctor),
              appBarText: "Doctor Details"),
          SizedBox(height: 34.h),
          GetBuilder(
            init: DoctorDetailsController(),
            builder: (controller) {
              return Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.blackColor.withOpacity(0.08),
                              blurRadius: 20),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomListTile(
                        textwidgetRightPadding: 9.w,
                        textwidgetBottomPadding: 72.h,
                        elevation: 2,
                        textwidget: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '\$',
                              style: AppTextStyles.nameText(context)
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                            Text(
                              ' 28.00/hr',
                              style: AppTextStyles.nameText(context).copyWith(
                                  color: AppColor.darkGreyColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        favorateSize: 25,
                        imageRadius: 8.r,
                        favorateRightPadding: 12,
                        favorateTopPadding: 16,
                        starSize: 15,
                        titleFontSize: 18,
                        subTitleFontSize: 14,
                        imageHeight: 87.h,
                        imageWidth: 92.w,
                        leftPading: 19.w,
                        topPading: 18.h,
                        height: 170.h,
                        width: 335.w,
                        onTap: () => controller.toggleFavorite(0),
                        clinicName: 'Specialist Cardiologist ',
                        doctorName: 'Dr. Pediatrician',
                        imagePath: AppAssets.img15,
                        rate: 4,
                        isFavorite: controller.isFavoriteList[0],
                        heightSpaceAboveStars: 6.h,
                        child: AppButton(
                          borderRadius: 4,
                          buttonWidth: 140.w,
                          buttonHeight: 32.h,
                          buttonText: 'Book Now',
                          textStyle: AppTextStyles.buttonText(context),
                          onTap: () => Get.toNamed(Routes.selectTime),
                        ),
                      )),
                  SizedBox(height: 24.h),
                  Container(
                    width: 305.w,
                    height: 84.h,
                    decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.blackColor.withOpacity(0.08),
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SelectBookTime(
                            titleTextStile:
                                AppTextStyles.doctorNameText(context)
                                    .copyWith(height: 1),
                            responsivWidth: 90.w,
                            responsivHeight: 64,
                            subTitle: 'Runing',
                            subTitleTextStile: AppTextStyles.subtitle(context),
                            isSelected: true,
                            bookDate: '100',
                            availableSlots: -1),
                        SelectBookTime(
                            titleTextStile:
                                AppTextStyles.doctorNameText(context)
                                    .copyWith(height: 1),
                            subTitle: 'Ongoing',
                            responsivWidth: 90.w,
                            responsivHeight: 64,
                            subTitleTextStile: AppTextStyles.subtitle(context),
                            isSelected: true,
                            bookDate: '500',
                            availableSlots: -1),
                        SelectBookTime(
                            titleTextStile:
                                AppTextStyles.doctorNameText(context)
                                    .copyWith(height: 1),
                            responsivWidth: 90.w,
                            responsivHeight: 64,
                            subTitleTextStile: AppTextStyles.subtitle(context),
                            isSelected: true,
                            subTitle: 'Patient',
                            bookDate: '700',
                            availableSlots: -1),
                      ],
                    ),
                  ),
                  SizedBox(height: 27.h),
                  Row(children: [
                    Text('Services',
                        style: AppTextStyles.nameText(context)
                            .copyWith(color: AppColor.titleColor)),
                  ]),
                  SizedBox(height: 17.h),
                  SizedBox(
                    height: 160.h,
                    child: ListView.separated(
                      itemCount: 3,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 17.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: '${index + 1}. ',
                                style: AppTextStyles.nameText(context).copyWith(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: reminderTexts[index],
                                style: AppTextStyles.nameText(context).copyWith(
                                  color: AppColor.titleColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                ),
                              )
                            ])),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 0.8,
                              color: AppColor.darkGreyColor.withOpacity(0.1),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                      height: 210.h,
                      width: 335.w,
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.blackColor.withOpacity(0.08),
                                blurRadius: 30)
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const LiveMapWidget()))
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

List<String> reminderTexts = [
  "  Patient care should be the number one priority.",
  "  If you run your practiceyou know how frustrating.",
  "  That’s why some of appointment reminder system."
];
