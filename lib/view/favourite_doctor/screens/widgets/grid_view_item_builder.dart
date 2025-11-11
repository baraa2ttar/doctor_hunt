import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/favourite_doctor/screens/widgets/favourite_card.dart';

import '../../controller/favourite_doctor_controller.dart';

class GridViewItemBuilder extends StatelessWidget {
  const GridViewItemBuilder({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final FavouriteDoctorController controller =
        Get.find<FavouriteDoctorController>();
    return FavouriteCard(
      categoryFontSize: 12.sp,
      doctorNameFontSize: 15.sp,
      widget: Container(
        padding: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => controller.toggleGridFavorite(index),
          child: Icon(
            Icons.favorite,
            color: AppColor.redColor,
          ),
        ),
      ),
      width: 140.w,
      height: 180.h,
      category: controller.doctors[index].category,
      doctorName: controller.doctors[index].name,
      image: AppConstants.imageList[index],
      imageSize: 84.h,
    );
  }
}
