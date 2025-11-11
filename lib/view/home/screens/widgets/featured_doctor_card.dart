import 'package:adv/core/exports/ui_exports.dart';

class FeaturedDoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final double rating;
  final bool isFavorite;

  const FeaturedDoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 14,
                color: isFavorite ? AppColor.redColor : const Color(0xffD4CCCC),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  SizedBox(width: 2.w),
                  Text(
                    rating.toString(),
                    style: AppTextStyles.subtitle(context).copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6.h),

          CircleAvatar(
            radius: 35.h,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(height: 8.h),

            
          Text(
            name,
            style: AppTextStyles.subtitle(context).copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.titleColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: price.replaceAll("\$", ""),
                  style: TextStyle(
                    color: AppColor.darkGreyColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}