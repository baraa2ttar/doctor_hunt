import 'package:adv/core/exports/ui_exports.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const AppBackground({super.key, required this.child, this.padding,});

  @override
  Widget build(BuildContext context) {
    double circleSize = 200;
    double circleOffset = -80;

    if (context.isDesktop) {
      circleSize = context.screenWidth * 0.25;
      circleOffset = -circleSize * 0.4;
    }
    if (context.isLargeDesktop) {
      circleSize = context.screenWidth * 0.3;
      circleOffset = -circleSize * 0.45;
    }
    if (context.is4K) {
      circleSize = context.screenWidth * 0.35;
      circleOffset = -circleSize * 0.5;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Stack(
        children: [
          Positioned(
            top: circleOffset,
            left: circleOffset,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color:AppColor.lightblueColor ,
                    blurRadius: circleSize * 0.5,
                    spreadRadius: circleSize * 0.3,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: circleOffset,
            right: circleOffset,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryColor.withValues(alpha: 0.3),
                    blurRadius: circleSize * 0.5,
                    spreadRadius: circleSize * 0.3,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: padding ?? EdgeInsets.all(context.pw(20)),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: context.screenHeight,
                    minWidth: context.screenWidth
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}