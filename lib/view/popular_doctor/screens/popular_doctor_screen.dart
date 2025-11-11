import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/find_doctor/screens/widgets/custom_list_tile.dart';
import 'package:adv/view/find_doctor/screens/widgets/rating_stars.dart';
import 'package:adv/view/popular_doctor/controller/popular_doctor_controller.dart';

class PopularDoctorScreen extends StatelessWidget {
  const PopularDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          AppTopBar(onSearchTap: () => Get.toNamed(Routes.findDoctor)),
          SizedBox(height: 30.h),
          GetBuilder(
            init: PopularDoctorController(),
            builder: (controller) {
              return Column(
                children: [
                  Row(children: [
                    Text('Popular Doctor',
                        style: AppTextStyles.nameText(context).copyWith(
                            color: AppColor.titleColor, fontSize: 18)),
                    const Spacer(),
                    Text('See all',
                        style: AppTextStyles.hintText(context)
                            .copyWith(fontSize: 10.sp)),
                    SizedBox(width: 2.w),
                    Icon(Icons.arrow_forward_ios,
                        size: 9, color: AppColor.darkGreyColor)
                  ]),
                  SizedBox(height: 22.h),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.blackColor.withOpacity(0.03),
                            blurRadius: 40,
                          ),
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 210.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 2),
                            itemCount: imageList.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 12.w),
                            itemBuilder: (context, index) {
                              return Container(
                                width: 136.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imageList[index],
                                        width: 136.w,
                                        height: 131.h,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 7.h),
                                      Text(
                                        namesList[index],
                                        style: AppTextStyles.doctorNameText(
                                            context)
                                            .copyWith(fontSize: 14.sp),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        categoryList[index],
                                        style: AppTextStyles.hintText(context)
                                            .copyWith(fontSize: 10.sp),
                                      ),
                                      SizedBox(height: 4.h),
                                      const RatingStars(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        rate: 4,
                                        starSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(children: [
                    Text('Category',
                        style: AppTextStyles.nameText(context)
                            .copyWith(color: AppColor.titleColor)),
                  ]),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blackColor.withOpacity(0.03),
                          blurRadius: 40,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 365.h,
                    child: ListView.separated(
                      itemCount: namesList1.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 14.h);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CustomListTile(
                          textwidgetBottomPadding: 12.h,
                          textwidgetRightPadding: 9.w,
                          textwidget: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '2.4',
                                style: AppTextStyles.nameText(context)
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              Text(
                                ' (2475 views)',
                                style: AppTextStyles.nameText(context).copyWith(
                                    color: AppColor.darkGreyColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp),
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
                          imageHeight: 82.h,
                          imageWidth: 82.w,
                          leftPading: 12.w,
                          topPading: 11.h,
                          height: 104.h,
                          width: 335.w,
                          onTap: () => controller.toggleFavorite(
                              index: index,
                              name: namesList1[index],
                              category: categoryList1[index],
                              experienceYears: 10),
                          clinicName: categoryList1[index],
                          doctorName: namesList1[index],
                          imagePath: imageList1[index],
                          rate: 4,
                          isFavorite: controller.isFavoriteList[index],
                          heightSpaceAboveStars: 6.h,
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

List<String> imageList = [
  AppAssets.img8,
  AppAssets.img13,
  AppAssets.img14,
];

List<String> namesList = [
  'Dr. Truluck Nik',
  'Dr. Tranquilli',
  'Dr. Truluck Nik'
];
List<String> categoryList = [
  'Medicine Specialist',
  'Patheology Specialist',
  'Medicine Specialist'
];
List<String> imageList1 = [
  AppAssets.img15,
  AppAssets.img14,
  AppAssets.img2,
  AppAssets.img13,
];

List<String> namesList1 = [
  'Dr. Pediatrician',
  'Dr. Mistry Brick',
  'Dr. Ether Wall',
  'Dr. Johan smith'
];
List<String> categoryList1 = [
  'Specialist cardiologist',
  'Specialist Dentist ',
  'Specialist Cancer',
  'Specialist cardiologist'
];
