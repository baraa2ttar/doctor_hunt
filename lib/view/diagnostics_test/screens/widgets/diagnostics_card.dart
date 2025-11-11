import 'package:adv/core/exports/ui_exports.dart';

class DiagnosticsCard extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final int numberOfTests;
  final String image;
  final int price;
  final int offPrice;
  final int percentageOff;

  const DiagnosticsCard({
    super.key,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.numberOfTests,
    required this.image,
    required this.price,
    required this.offPrice,
    required this.percentageOff,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2), // vertical shadow
          ),
        ],
      ),
      // padding: EdgeInsets.all(14.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.h(10)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              cardTitle,
              style: AppTextStyles.nameText(context).copyWith(
                  color: AppColor.blackColor, fontSize: context.sp(15)),
            ),
          ),
          SizedBox(height: context.h(6)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              cardSubtitle,
              style: AppTextStyles.hintText(context).copyWith(
                fontSize: context.sp(14),
              ),
            ),
          ),
          SizedBox(height: context.h(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColor.primaryColor),
                color: AppColor.whiteColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                "$numberOfTests tests included",
                style: AppTextStyles.greenText(context).copyWith(
                  fontSize: context.sp(12),
                ),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              image,
              width: context.w(335),
              height: context.h(220),
              fit: BoxFit.cover,
              // Image.network(
              //   image,
              //   width: context.w(335),
              //   height: context.h(220),
              //   fit: BoxFit.cover,
              //   errorBuilder: (context, error, stackTrace) {
              //     return Container(
              //       width: context.w(335),
              //       height: context.h(220),
              //       color: Colors.grey.shade300,
              //       alignment: Alignment.center,
              //       child: Icon(
              //         Icons.broken_image,
              //         size: 40,
              //         color: Colors.grey.shade700,
              //       ),
              //     );
              //   },
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$$price",
                            style: AppTextStyles.doctorNameText(context),
                          ),
                          SizedBox(width: context.w(8)),
                          Text(
                            "\$$offPrice",
                            style: AppTextStyles.subtitle(context)
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: context.w(8)),
                          Text(
                            "$percentageOff%",
                            style: AppTextStyles.greenText(context),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "off",
                            style: AppTextStyles.greenText(context),
                          ),
                        ],
                      ),
                      SizedBox(height: context.h(4)),
                      Text(
                        AppStrings.diagnosticsOffer,
                        style: AppTextStyles.hintText(context)
                            .copyWith(fontSize: context.sp(14)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.w(8)),
                AppButton(
                  borderRadius: 6.r,
                  buttonWidth: context.w(100),
                  buttonHeight: context.h(38),
                  buttonText: "Book Now",
                  textStyle: AppTextStyles.buttonText(context).copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  onTap: () => Get.toNamed(Routes.emptyDetails),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
