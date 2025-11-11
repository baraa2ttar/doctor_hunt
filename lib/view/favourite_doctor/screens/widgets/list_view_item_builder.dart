import 'package:adv/view/favourite_doctor/screens/widgets/favourite_card.dart';

import '../../../../core/exports/ui_exports.dart';
import '../../controller/favourite_doctor_controller.dart';

class ListViewItemBuilder extends StatelessWidget {
  const ListViewItemBuilder({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final FavouriteDoctorController controller =
        Get.find<FavouriteDoctorController>();
    return FavouriteCard(
      rowWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$',
            style: AppTextStyles.greenText(context).copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 9.sp,
                color: AppColor.primaryColor),
          ),
          Text(
            ' 22.00/ hours',
            style: AppTextStyles.greenText(context).copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 9.sp,
                color: AppColor.darkGreyColor),
          ),
        ],
      ),
      widget: Padding(
        padding: EdgeInsets.only(top: 9.h, left: 10.w, right: 10.w),
        child: Row(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () => controller.toggleListFavorite(index),
                child: Icon(
                  size: 15,
                  controller.isFavoriteList[index]
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: controller.isFavoriteList[index]
                      ? AppColor.redColor
                      : const Color(0xffD4CCCC),
                ),
              ),
            ),
            const Spacer(),
            Icon(Icons.star, color: AppColor.yellowColor, size: 15),
            const SizedBox(width: 3),
            Text(
              controller.doctors[index].rating.toString(),
              style: AppTextStyles.subtitle(context).copyWith(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp),
            )
          ],
        ),
      ),
      categoryFontSize: 9.sp,
      doctorNameFontSize: 12.sp,
      height: 130.h,
      width: 96.w,
      imageSize: 54.h,
      image: AppConstants.imageList[index],
      doctorName: controller.doctors[index].name,
    );
  }
}

