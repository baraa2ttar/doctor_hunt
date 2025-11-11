import 'package:flutter/material.dart';
class CircleCheckbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final double size;
  final Color selectedColor;
  final Color borderColor;
  final Color unselectedBackgroundColor;

  const CircleCheckbox({
    super.key,
    required this.isSelected,
    required this.onTap,
    this.size = 16.0,
    this.selectedColor = Colors.blue,
    this.borderColor = Colors.grey,
    this.unselectedBackgroundColor = const Color(0xFFE0E0E0), // لون رمادي افتراضي
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? selectedColor : unselectedBackgroundColor,
          border: Border.all(color: borderColor, width: 2),
        ),
        child: isSelected
            ? Center(
          child: Icon(
            Icons.check,
            size: size * 0.6,
            color: Colors.white,
          ),
        )
            : null,
      ),
    );
  }
}
