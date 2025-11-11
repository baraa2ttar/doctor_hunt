import 'package:adv/core/exports/ui_exports.dart';

class LiveDoctorList extends StatelessWidget {
  final List<String> liveDoctorImages;

  const LiveDoctorList({super.key, required this.liveDoctorImages});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 25.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          'Live Doctors',
          style: AppTextStyles.headline(context).copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.titleColor,
          ),
        ),
      ),
      SizedBox(height: 12.h),
      SizedBox(
        height: 140.h,
        width: double.infinity, //
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: liveDoctorImages.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 104.w, //
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.chat),
                child: 
              Stack(
  children: [
    // Doctor image
    ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.asset(
        liveDoctorImages[index],
        height: 140.h,
        width: 120.w,
        fit: BoxFit.cover,
      ),
    ),

    Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.25),
              Colors.black.withOpacity(0.35),
              Colors.black.withOpacity(0.45),
            ],
          ),
        ),
      ),
    ),

  
    Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          'LIVE',
          style: AppTextStyles.buttonText(context).copyWith(
            fontSize: 10.sp,
            color: Colors.white,
          ),
        ),
      ),
    ),

    
    Positioned.fill(
      child: Center(
        child: SvgPicture.asset(AppAssets.play)
        
        //  Icon(Icons.play_arrow,
        //     color: Colors.white70, size: 36.sp),
      ),
    ),
  ],
),
              ),
            );
          },
        ),
      )
    ]);
  }
}
