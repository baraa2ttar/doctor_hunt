import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/find_doctor/screens/widgets/rating_stars.dart';

class DoctorListTile extends StatelessWidget {
  final String doctorName;
  final String clinicName;
  final String imagePath;
  final int rate;
  final bool isFavorite;
  final VoidCallback? onTap;

  const DoctorListTile({
    super.key,
    required this.doctorName,
    required this.clinicName,
    required this.imagePath,
    required this.rate,
    this.isFavorite = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColor.whiteColor,
      elevation: 8,
      shadowColor: AppColor.blackColor.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.asset(
                imagePath,
                width: 72.w,
                height: 68.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    doctorName,
                    style: AppTextStyles.nameText(context).copyWith(
                      fontSize: 15.sp,
                      color: AppColor.titleColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    clinicName,
                    style: AppTextStyles.subtitle(context).copyWith(
                      fontSize: 11.sp,
                      color: AppColor.darkGreyColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  RatingStars(rate: rate, starSize: 10),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Icon(
                  Icons.favorite,
                  size: 18,
                  color: isFavorite
                      ? AppColor.redColor
                      : AppColor.unselectedFavoriteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
