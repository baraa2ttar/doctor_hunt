import 'package:adv/core/exports/ui_exports.dart';

class AppTopBar extends StatelessWidget {
  final String? appBarText;
  final String? image;
  final VoidCallback? onSearchTap;

  const AppTopBar( {
    super.key,
    this.appBarText,
    this.image,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 35.h,
            width: 35.w,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColor.whiteColor,
            ),
            child: Center(
                child: Icon(Icons.arrow_back_ios_rounded,
                    color: AppColor.darkGreyColor, size: 18.sp)),
          ),
        ),
        SizedBox(width: 19.w),
        // Optional title
        Text(
          appBarText ?? '',
          textAlign: TextAlign.center,
          style: AppTextStyles.doctorNameText(context),
        ),
        // Conditional rendering
        const Spacer(),
        if (image == null && onSearchTap != null)
          GestureDetector(
            onTap: onSearchTap,
            child: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.search,
                  color: AppColor.darkGreyColor,
                  size: 28.sp,
                ),
              ),
            ),
          )
        else if (image != null)
          ClipOval(
            child: Image.asset(
              image!,
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}