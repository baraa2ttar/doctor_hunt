import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/home/screens/widgets/home_top_bar.dart';
import 'package:adv/view/home/screens/widgets/live_doctor_list.dart';
import 'package:adv/view/home/screens/widgets/popular_doctor_list.dart';
import 'package:adv/view/home/screens/widgets/specialties_row.dart';
import 'package:adv/view/home/screens/widgets/featured_doctor_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      padding: EdgeInsets.zero,
      child: GetBuilder(
          init: HomeController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stack only for top bar + search bar overlap
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _buildTopGradient(),
                    Positioned(
                      top: 36.h,
                      left: 20.w,
                      right: 20.w,
                      child: const HomeTopBar(),
                    ),
                    // Positioned search bar overlapping gradient
                    Positioned(
                      bottom: -30.h, // controls how much it overlaps
                      left: 20.w,
                      right: 20.w,
                      child: AppSearchBar(
                        controller: controller.searchController,
                        fillColor: Colors.white,
                        borderRadius: 12.r,
                        onChanged: (_) {},
                        onClear: controller.clearText,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                LiveDoctorList(liveDoctorImages: controller.liveDoctorImages),
                SizedBox(height: 24.h),

                SpecialtiesRow(specialtiesImages: [
                  AppAssets.img23,
                  AppAssets.img24,
                  AppAssets.img25,
                  AppAssets.img26,
                ]),

                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Doctor',
                        style: AppTextStyles.headline(context)
                            .copyWith(fontSize: 18.sp),
                      ),
                      GestureDetector(
                        onTap: ()=> Get.toNamed(Routes.popularDoctor),
                        child: Text(
                          'See all >',
                          style: AppTextStyles.subtitle(context).copyWith(
                            fontSize: 12.sp,
                            color: AppColor.darkGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22.h),

                PopularDoctorList(),
                SizedBox(height: 24.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Doctor',
                        style: AppTextStyles.headline(context)
                            .copyWith(fontSize: 18.sp),
                      ),
                      Text(
                        'See all >',
                        style: AppTextStyles.subtitle(context).copyWith(
                          fontSize: 12.sp,
                          color: AppColor.darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                SizedBox(
                  height: 160.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: controller.featuredDoctors.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      final doctor = controller.featuredDoctors[index];
                      return FeaturedDoctorCard(
                        image: doctor.image,
                        name: doctor.name,
                        price: doctor.price,
                        rating: doctor.rating,
                        isFavorite: doctor.isFavorite,
                      );
                    },
                  ),
                ),

                SizedBox(height: 100.h),
              ],
            );
          }),
    );
  }

  Widget _buildTopGradient() {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)],
        ),
      ),
    );
  }
}
