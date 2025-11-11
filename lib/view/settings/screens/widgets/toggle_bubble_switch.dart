import 'package:adv/core/exports/ui_exports.dart';

class ToggleBubbleSwitch extends StatelessWidget {
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final Color bubbleColor;
  final VoidCallback onTap;
  final bool toggled;

  const ToggleBubbleSwitch({
    super.key,
    required this.width,
    required this.height,
    required this.activeColor,
    required this.inactiveColor,
    required this.bubbleColor,
    required this.onTap,
    required this.toggled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        height: height,
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          color: toggled ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: toggled ? Alignment.centerRight : Alignment.centerLeft,
          curve: Curves.easeInOut,
          child: Container(
            width: height - 4,
            height: height - 4,
            decoration: BoxDecoration(
              color: bubbleColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
