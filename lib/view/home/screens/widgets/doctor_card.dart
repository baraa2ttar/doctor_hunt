// File: widgets/doctor_card.dart
import 'package:adv/core/exports/ui_exports.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String? name;
  final double width;
  final double height;
  final bool live;

  const DoctorCard({
    super.key,
    required this.image,
    this.name,
    this.width = 110,
    this.height = 140,
    this.live = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey.shade200,
      ),
      clipBehavior: Clip.hardEdge,
      child: live
          ? Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
                const Center(
                  child: Icon(Icons.play_circle_outline,
                      color: Colors.white70, size: 36),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(6.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Text('LIVE',
                        style: AppTextStyles.buttonText(context)
                            .copyWith(fontSize: 10.sp)),
                  ),
                ),
              ],
            )
          : name != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    color: Colors.white70,
                    child: Text(name!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.doctorNameText(context)),
                  ),
                )
              : const SizedBox(),
    );
  }
}
