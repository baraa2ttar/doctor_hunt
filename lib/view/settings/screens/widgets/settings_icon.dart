import 'package:adv/core/exports/ui_exports.dart';

class SettingsIcon extends StatelessWidget {
  final Color color;
  final String svgIcon;
  const SettingsIcon({super.key, required this.color, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
      child: SvgPicture.asset(svgIcon),
    );
  }
}
