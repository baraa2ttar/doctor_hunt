import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/doctors/controller/doctor_controller.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final int index;
  const DoctorCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
      final DoctorsController controller = Get.find();
    return GestureDetector(
      onTap: ()=> Get.toNamed(Routes.doctorDetails),
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 82.w,
                height: 82.h,
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
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyles.headline(
                            context,
                          ).copyWith(fontSize: context.sp(18)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Obx(() {
                        final isFav = controller.isFavoriteList[index];
                        return GestureDetector(
                          onTap: () => controller.toggleFavorite(index),
                          child: SvgPicture.asset(
                            isFav
                                ? AppAssets.redHeartIcon
                                : AppAssets.greyHeartIcon,
                            height: 20.h,
                            width: 20.w,
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subTitle,
                    style: AppTextStyles.hintText(
                      context,
                    ).copyWith(fontSize: context.sp(14)),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Row(
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(
                              index < 4
                                  ? AppAssets.yellowStarIcon
                                  : AppAssets.greyStarIcon,
                              width: 12.w,
                              height: 12.h,
                            ),
                          );
                        }),
                      ),
      
                      Row(
                        children: [
                          Text(
                            "2.8",
                            style: AppTextStyles.headline(
                              context,
                            ).copyWith(fontSize: context.sp(16)),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "(2821 views)",
                            style: AppTextStyles.nameText(context).copyWith(
                                color: AppColor.darkGreyColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
