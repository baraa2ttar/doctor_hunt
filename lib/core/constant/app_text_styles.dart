import 'package:adv/core/constant/app_colors.dart';
import 'package:adv/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class AppTextStyles {

  static TextStyle headline(BuildContext context) => TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColor.titleColor,
    fontSize: context.sp(28)
  );

  static TextStyle subtitle (BuildContext context) =>  TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColor.darkGreyColor,
    fontSize: context.sp(14)
  );

  static TextStyle doctorNameText(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColor.titleColor,
      fontSize: context.sp(18)
  );

  static TextStyle nameText(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColor.whiteColor,
      fontSize: context.sp(16)
  );

  static TextStyle greenText(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColor.primaryColor,
      fontSize: context.sp(13)
  );

  static TextStyle buttonText(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColor.whiteColor,
      fontSize: context.sp(14)
  );

  static TextStyle hintText(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w300,
      color: AppColor.darkGreyColor,
      fontSize: context.sp(16)
  );

}
