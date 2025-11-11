import 'package:adv/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;

  const CustomSearchField({
    super.key,
    required this.controller,
    this.hintText = "Search",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
      BoxShadow(
        color: AppColor.lightGreyColor.withOpacity(0.1), // Grey shadow with some transparency
        spreadRadius: 2,
        blurRadius: 2,  
        offset: Offset(0, 1),
      ),
    ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff0EBE7F),
            fontWeight: FontWeight.w300,
            fontSize: 18
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
