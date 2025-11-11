import '../../../../core/exports/ui_exports.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rate,
    required this.starSize,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int rate;
  final double starSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(
        5,
            (index) => Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: SvgPicture.asset(
            width: starSize,
            height: starSize,
            AppAssets.yellowStarIcon,
            color: index < rate
                ? AppColor.yellowColor
                : AppColor.unselectedFavoriteColor,
          ),
        ),
      ),
    );
  }
}
