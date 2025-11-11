import 'package:adv/core/exports/ui_exports.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Hi Handwerker!',
              style: AppTextStyles.subtitle(context)
                  .copyWith(color: Colors.white70, fontSize: 18.sp),
            ),
            SizedBox(height: 6.h),
            Text(
              'Find Your Doctor',
              style: AppTextStyles.headline(context)
                  .copyWith(color: Colors.white, fontSize: 24),
            ),
          ]),
          CircleAvatar(
            radius: 33.r,
            backgroundImage: AssetImage(AppAssets.img19),
          ),
        ],
      ),
    );
  }
}
