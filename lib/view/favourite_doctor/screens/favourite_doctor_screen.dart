import 'package:adv/core/exports/ui_exports.dart';
import '../controller/favourite_doctor_controller.dart';
import 'widgets/grid_view_item_builder.dart';
import 'widgets/list_view_item_builder.dart';

class FavouriteDoctorScreen extends StatelessWidget {
    final FavouriteDoctorController controller = Get.put(FavouriteDoctorController());

  FavouriteDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return AppBackground(
      child: Column(
        children: [
          const AppTopBar(appBarText: 'Favourite Doctors'),
          SizedBox(height: 34.h),
          Obx(() {
            if (controller.isLoading.value) {
              return SizedBox(
                height: 600.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: CircularProgressIndicator()),
                  ],
                ),
              );
            }

            if (controller.doctors.isEmpty) {
              return SizedBox(
                height: 600.h,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(child: Text('No Doctors in Favourite.'))
                    ]),
              );
            }

            return Column(
              children: [
                AppTextFormField(
                  borderColor: AppColor.whiteColor,
                  controller: controller.searchController,
                  hintStyle: AppTextStyles.hintText(context)
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(17),
                    child: SvgPicture.asset(AppAssets.searchIcon),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: controller.clearSearch,
                    child: Icon(
                      Icons.close,
                      color: AppColor.darkGreyColor,
                    ),
                  ),
                  hintText: 'Search Doctor...',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.primaryColor, width: 1.3),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, -1),
                        blurRadius: 20,
                        color: AppColor.blackColor.withOpacity(0.04))
                  ]),
                  height: 400.h,
                  child: Obx(() => GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            mainAxisSpacing: 15.h,
                            crossAxisSpacing: 15.w),
                        itemCount: controller.doctors.length,
                        itemBuilder: (context, index) {
                          return GridViewItemBuilder(
                            index: index,
                          );
                        },
                      )),
                ),
                SizedBox(height: 10.h),
                Row(children: [
                  Text('Feature Doctor',
                      style: AppTextStyles.nameText(context)
                          .copyWith(color: AppColor.titleColor, fontSize: 18)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.popularDoctor),
                    child: Text('See all',
                        style: AppTextStyles.hintText(context)
                            .copyWith(fontSize: 10.sp)),
                  ),
                  SizedBox(width: 2.w),
                  Icon(Icons.arrow_forward_ios,
                      size: 9, color: AppColor.darkGreyColor)
                ]),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, -1),
                        blurRadius: 20,
                        color: AppColor.blackColor.withOpacity(0.04))
                  ]),
                  height: 130.h,
                  child: Obx(() => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.doctors.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 12.w);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ListViewItemBuilder(
                            index: index,
                          );
                        },
                      )),
                ),
                const SizedBox(height: 65)
              ],
            );
          }),
        ],
      ),
    );
  }
}
