import '../../../../core/exports/ui_exports.dart';

class SelectBookTime extends StatelessWidget {
  const SelectBookTime(
      {super.key,
      required this.isSelected,
      this.onTap,
      required this.bookDate,
      required this.availableSlots,
      this.responsivHeight = 54,
      this.subTitleTextStile = const TextStyle(),
      this.titleTextStile = const TextStyle(),
      this.subTitle = '',
      this.responsivWidth});
  final bool isSelected;
  final void Function()? onTap;
  final String bookDate;
  final int availableSlots;
  final double responsivHeight;
  final double? responsivWidth;
  final TextStyle subTitleTextStile;
  final TextStyle titleTextStile;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: responsivWidth,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: responsivHeight.h,
        decoration: BoxDecoration(
            border: isSelected
                ? const Border()
                : Border.all(
                    width: 1, color: AppColor.darkGreyColor.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(6.r),
            color: availableSlots == -1
                ? const Color(0x20CBCBCB)
                : isSelected
                    ? AppColor.primaryColor
                    : Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(bookDate,
                style: availableSlots == -1
                    ? titleTextStile
                    : AppTextStyles.title(context).copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? AppColor.whiteColor
                            : AppColor.titleColor)),
            availableSlots == -1
                ? Text(
                    subTitle,
                    style: subTitleTextStile,
                  )
                : Text(
                    availableSlots == 0
                        ? 'No slots available'
                        : '$availableSlots slots available',
                    style: AppTextStyles.subtitle(context).copyWith(
                        fontSize: 10.sp,
                        color: isSelected
                            ? AppColor.whiteColor
                            : AppColor.titleColor),
                  ),
          ],
        ),
      ),
    );
  }
}
