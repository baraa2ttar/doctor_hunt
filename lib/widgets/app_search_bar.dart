import 'package:adv/core/constant/app_colors.dart';
import 'package:adv/core/constant/app_text_styles.dart';
import 'package:flutter/material.dart';


class AppSearchBar extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final bool? filled;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final Color? iconColor;
  final Widget? crossIcon;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;

  const AppSearchBar({
    super.key,
    this.focusNode,
    this.controller,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.filled,
    this.onChanged,
    this.onClear,
    this.iconColor,
    this.crossIcon,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveRadius = borderRadius ?? 12;

    return Container(
      decoration: BoxDecoration(
        color: fillColor ?? Colors.white,
        borderRadius: BorderRadius.circular(effectiveRadius),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search ....',
          hintStyle: AppTextStyles.hintText(context).copyWith(fontWeight: FontWeight.w400),
          prefixIcon: Icon(
            Icons.search,
            color: iconColor ?? AppColor.darkGreyColor,
          ),
          suffixIcon: onClear == null
              ? null
              : IconButton(
            icon: crossIcon ??
                Icon(
                  Icons.close,
                  size: 20,
                  color: iconColor ?? AppColor.darkGreyColor,
                ),
            onPressed: onClear,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(effectiveRadius),
                borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
              ),
          fillColor: Colors.transparent, // Container handles background
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}