import '../../../../core/exports/ui_exports.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    required this.height,
    required this.width,
    required this.imageSize,
    required this.image,
    this.category,
    required this.doctorName,
    this.widget = const SizedBox(),
    required this.doctorNameFontSize,
    required this.categoryFontSize,
    this.rowWidget,
  });
  final Widget widget;
  final double height;
  final double width;
  final double imageSize;
  final double doctorNameFontSize;
  final double categoryFontSize;
  final Widget? rowWidget;

  final String image;
  final String? category;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //       offset: const Offset(0, -1),
        //       blurRadius: 20,
        //       color: AppColor.blackColor.withOpacity(0.06))
        // ],
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          widget,
          ClipRRect(
            borderRadius: BorderRadius.circular(42),
            child: Image.asset(
              fit: BoxFit.cover,
              width: imageSize,
              height: imageSize,
              image,
            ),
          ),
          SizedBox(height: 11.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w), //Abrar
            child: Text(
              overflow: TextOverflow.ellipsis,
              doctorName,
              style: AppTextStyles.doctorNameText(context)
                  .copyWith(fontSize: doctorNameFontSize),
            ),
          ),
          rowWidget ??
              Text(
                category ?? '',
                style: AppTextStyles.greenText(context)
                    .copyWith(fontSize: categoryFontSize),
              ),
        ],
      ),
    );
  }
}
