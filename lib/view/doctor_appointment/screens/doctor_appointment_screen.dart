import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/doctor_appointment/controller/doctor_appointment_controller.dart';
import 'package:adv/view/find_doctor/screens/widgets/custom_list_tile.dart';

class DoctorAppointmentScreen extends StatelessWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(color: const Color(0xff76809F).withOpacity(0.12)),
    );
    return AppBackground(
      child: Column(
        children: [
          const AppTopBar(appBarText: "Appointment"),
          SizedBox(height: 34.h),
          GetBuilder(
            init: DoctorAppointmentController(),
            builder: (controller) {
              final doctor = controller.doctorData;

              return doctor == null
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blackColor.withOpacity(0.08),
                          blurRadius: 20.r,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CustomListTile(
                      textwidgetRightPadding: 9.w,
                      textwidgetBottomPadding: 16.h,
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
                            ' ${doctor["appoint_price"]}/hr',
                            style:
                            AppTextStyles.nameText(context).copyWith(
                              color: AppColor.darkGreyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      favorateSize: 25,
                      imageRadius: 8.r,
                      favorateRightPadding: 12,
                      favorateTopPadding: 25,
                      starSize: 15,
                      titleFontSize: 16,
                      subTitleFontSize: 14,
                      imageHeight: 87.h,
                      imageWidth: 92.w,
                      leftPading: 18.w,
                      topPading: 18.h,
                      height: 123.h,
                      width: 335.w,
                      fixedHeight: 5,
                      onTap: () => controller.toggleFavorite(0),
                      clinicName: doctor["specialization"]["name"] ?? '',
                      doctorName: doctor["name"] ?? '',
                      imagePath: AppConstants.imageList.first,
                      rate: 4,
                      isFavorite: controller.isFavoriteList.isNotEmpty &&
                          controller.isFavoriteList[0],
                      heightSpaceAboveStars: 12.h,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(children: [
                    Text('Appointment For',
                        style: AppTextStyles.nameText(context)
                            .copyWith(color: AppColor.titleColor))
                  ]),
                  SizedBox(height: 20.h),
                  AppTextFormField(
                    controller: controller.patientNameController,
                    hintStyle: AppTextStyles.hintText(context)
                        .copyWith(fontSize: 14.sp),
                    hintText: 'Patient Name',
                    enabledBorder: border,
                    focusedBorder: border,
                    decoration: const BoxDecoration(),
                  ),
                  SizedBox(height: 18.h),
                  AppTextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller.contactNumberController,
                    hintStyle: AppTextStyles.hintText(context)
                        .copyWith(fontSize: 14.sp),
                    hintText: 'Contact Number',
                    enabledBorder: border,
                    focusedBorder: border,
                    decoration: const BoxDecoration(),
                  ),
                  SizedBox(height: 30.h),
                  Row(children: [
                    Text('Who is this patient?',
                        style: AppTextStyles.nameText(context)
                            .copyWith(color: AppColor.titleColor))
                  ]),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 175,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length + 1,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              Container(
                                width: 100.w,
                                height: 130.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.primaryColor
                                      .withOpacity(0.2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add,
                                        size: 50,
                                        color: AppColor.primaryColor),
                                    SizedBox(height: 10.h),
                                    Text(
                                      'Add',
                                      style:
                                      AppTextStyles.greenText(context)
                                          .copyWith(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Container(
                                width: 100.w,
                                height: 130.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(6.r),
                                  child: Image.asset(
                                    imageList[index - 1],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 7.h),
                              Text(stringList[index - 1],
                                  style: AppTextStyles.subtitle(context)),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AppButton(
                    borderRadius: 6.r,
                    buttonWidth: 295.w,
                    buttonHeight: 54.h,
                    buttonText: 'Next',
                    textStyle: AppTextStyles.buttonText(context)
                        .copyWith(fontSize: 18.sp),
                    onTap: controller.nextButtonNavigating,
                  ),
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
  AppAssets.img11,
  AppAssets.img18,
  AppAssets.img9,
];

List<String> stringList = [
  'My Self',
  'My child',
  'My wife',
];
