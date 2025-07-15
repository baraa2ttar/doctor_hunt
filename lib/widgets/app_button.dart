import 'package:adv/core/exports/ui_exports.dart';

class AppButton extends StatelessWidget {
  final double? buttonWidth;
  final double buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final Color? backgroundColor;
  final String? svgIcon;
  final VoidCallback onTap;


  const AppButton({
    super.key,
    this.backgroundColor,
    this.svgIcon,
    this.buttonWidth,
    required this.buttonHeight,
    required this.buttonText,
    required this.textStyle,
    required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor ?? AppColor.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child:  svgIcon != null ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svgIcon!),
              SizedBox(width: context.w(8)),
              Text(buttonText, style: textStyle),
            ],):
          Center(child:Text(buttonText, style: textStyle))

      ),
    );
  }
}
