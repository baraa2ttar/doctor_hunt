// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adv/view/find_doctor/screens/widgets/rating_stars.dart';

import '../../../../core/exports/ui_exports.dart';


class CustomListTile extends StatelessWidget {
  final String doctorName;
  final String clinicName;
  final String imagePath;
  final double? width;
  final double imageWidth;
  final double favorateTopPadding;
  final double favorateRightPadding;
  final double favorateSize;
  final double fixedHeight;

  final double imageHeight;
  final double height;
  final double topPading;

  final double imageRadius;
  final double elevation;
  final double textwidgetBottomPadding;
  final double textwidgetRightPadding;
  final double starSize;
  final double leftPading;
  final double subTitleFontSize;
  final double titleFontSize;
  final double heightSpaceAboveStars;
  final Widget? child;
  final Widget? textwidget;
  final int rate;
  final bool isFavorite;
  final void Function()? onTap;

  const CustomListTile({
    super.key,
    required this.doctorName,
    required this.clinicName,
    required this.imagePath,
    this.width,
    required this.height,
    required this.topPading,
    required this.leftPading,
    this.child,
    required this.rate,
    this.isFavorite = false,
    this.onTap,
    this.textwidget,
    required this.imageWidth,
    required this.imageHeight,
    required this.subTitleFontSize,
    required this.titleFontSize,
    required this.starSize,
    required this.heightSpaceAboveStars,
    required this.favorateTopPadding,
    required this.favorateRightPadding,
    required this.imageRadius,
    required this.favorateSize,
    this.textwidgetBottomPadding = 0,
    this.textwidgetRightPadding = 0,
    this.elevation = 10,
    this.fixedHeight = 0,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.doctorDetails),
      child: Card(
        margin: EdgeInsets.zero,
        shadowColor: AppColor.blackColor.withOpacity(0.2),
        elevation: elevation,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(top: topPading, left: leftPading),
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.whiteColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(imageRadius),
                    child: Image.asset(imagePath,
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: fixedHeight.h),
                      SizedBox(
                        child: Text(doctorName,
                            style: AppTextStyles.nameText(context).copyWith(
                                color: AppColor.titleColor,
                                fontSize: titleFontSize)),
                      ),
                      SizedBox(height: 4.h),
                      Text(clinicName,
                          style: AppTextStyles.subtitle(context).copyWith(
                              color: AppColor.darkGreyColor,
                              fontSize: subTitleFontSize,
                              fontWeight: FontWeight.w300)),
                      SizedBox(height: heightSpaceAboveStars),
                      RatingStars(
                        starSize: starSize,
                        rate: rate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: favorateTopPadding,
              right: favorateRightPadding,
              child: GestureDetector(
                onTap: onTap,
                child: Icon(
                  Icons.favorite,
                  size: favorateSize,
                  color: isFavorite
                      ? AppColor.redColor
                      : AppColor.unselectedFavoriteColor,
                ),
              ),
            ),
            Positioned(
                bottom: textwidgetBottomPadding,
                right: textwidgetRightPadding,
                child: textwidget ?? const SizedBox()),
            Positioned(
                top: 120.h, left: 97.w, child: child ?? const SizedBox()),
          ],
        ),
      ),
    );
  }
}
