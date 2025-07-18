import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/core/routing/routes.dart';

class   AppGeneralInfo extends StatelessWidget {
  final String? appTopBarText;
  final String? title;
  final String? subTitle;
  final String? iconPath;
  final String? buttonText;
  final VoidCallback? onTap;
  final double? iconWidth;
  final bool showButton;
  final bool showTopBar;
  final bool showSubtitle;

  const AppGeneralInfo({
    super.key,
    this.appTopBarText,
    this.title,
    this.subTitle,
    this.iconPath,
    this.buttonText,
    this.onTap,
    this.iconWidth,
    this.showButton = true,
    this.showTopBar = true,
    this.showSubtitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        if (showTopBar)
          AppTopBar(appBarText: appTopBarText ?? "AppBar Text"),

        SizedBox(height: context.h(120)),
        Container(
          padding: EdgeInsets.all(50.sp),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:  Color(0xffd3f3eb)

          ),
          child: Center(
            child: SvgPicture.asset(
                iconPath ?? "",

                width: iconWidth
            ),
          ),
        ),
        SizedBox(height: context.h(30)),
        Text(
          title ?? "Title",

          style: AppTextStyles.headline(context).copyWith(
            fontSize: context.sp(20),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.h(10)),
        if (showSubtitle) ...[
          Text(
            subTitle ?? "SubTitle",

            style: AppTextStyles.subtitle(context).copyWith(
            ),
            textAlign: TextAlign.center,
          )],
        if (showButton) ...[
          SizedBox(height: context.h(30)),
          AppButton(
            buttonHeight: context.h(54),
            buttonText: buttonText ?? "ButtonText",

            textStyle: AppTextStyles.buttonText(context).copyWith(
              fontSize: context.sp(18),
            ),
            onTap: onTap ?? () => Get.toNamed(Routes.patientDetails),
          ),
        ],
      ],
    );
  }
}
