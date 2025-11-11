import 'package:adv/core/exports/ui_exports.dart';

class PopularDoctorList extends StatelessWidget {
  const PopularDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> doctorImages = [
      AppAssets.img17,
      AppAssets.img10,
    ];

    final List<String> doctorNames = [
      'Dr. Fillerup Grab',
      'Dr. Blessing',
    ];

    final List<String> doctorSpecialties = [
      'Medicine Specialist',
      'Dentist Specialist',
    ];

    final List<int> ratings = [4, 4];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 40,
              )
            ],
          ),
          height: 275.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: doctorImages.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return Container(
                width: 190.w,
                // height: 264.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12.r)),
                      child: Image.asset(
                        doctorImages[index],
                        width: 190.w,
                        height: 180.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            doctorNames[index],
                            style: AppTextStyles.headline(context)
                                .copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            doctorSpecialties[index],
                            style: AppTextStyles.subtitle(context)
                                .copyWith(fontSize: 12.sp),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (starIdx) {
                              return Icon(
                                Icons.star,
                                size: 16,
                                color: starIdx < ratings[index]
                                    ? Colors.amber
                                    : Colors.grey.withOpacity(0.3),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
