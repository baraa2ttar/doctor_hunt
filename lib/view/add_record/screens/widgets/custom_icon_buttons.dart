import 'package:adv/core/exports/ui_exports.dart';

class CustomIconButtons extends StatelessWidget {
  final List<String> svgPaths;
  final List<String>
      textPaths; // Changed from TextPaths to textPaths for naming consistency
  final RxInt selectedIndex; // Added selectedIndex as a parameter
  final Function(int) selectButton; // Typing the selectButton as a function

  const CustomIconButtons({
    super.key,
    required this.svgPaths,
    required this.textPaths,
    required this.selectedIndex,
    required this.selectButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(svgPaths.length, (index) {
        return Obx(() => Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        svgPaths[index],
                        height: 23,
                        width: 17,
                        color: selectedIndex.value == index
                            ? AppColor.primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        selectButton(index);
                      },
                    ),
                    Text(
                      textPaths[index],
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: selectedIndex.value == index
                            ? AppColor.primaryColor
                            : Colors.grey,
                      ),
                    ),
                    // SizedBox(width: 20),
                  ],
                ),
                SizedBox(width: 40.w)
                // Padding(padding: EdgeInsets.all(20))
              ],
            ));
      }),
    );
  }
}
