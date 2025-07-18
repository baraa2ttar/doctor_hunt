import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure you have this import for SvgPicture
import 'package:get/get.dart';

class CustomIconButtons extends StatelessWidget {
  final List<String> svgPaths;
  final List<String> textPaths; // Changed from TextPaths to textPaths for naming consistency
  final RxInt selectedIndex; // Added selectedIndex as a parameter
  final Function(int) selectButton; // Typing the selectButton as a function

  CustomIconButtons({
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
                    color: selectedIndex.value == index ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    selectButton(index);
                  },
                ),
                Text(textPaths[index]),
                SizedBox(width: 20),
              ],
            ),
            Padding(padding: EdgeInsetsGeometry.all(20))
          ],
        ));
      }),
    );
  }
}