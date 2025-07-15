import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static Future<T?> show<T>({required Widget child}) {
    return Get.bottomSheet<T>(
      Container(

        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black ,// Shadow color
              spreadRadius: 2,                     // Spread radius
              blurRadius: 10,                       // Blur radius
              offset: const Offset(0,10),         // Offset for the shadow
            ),
          ],
        ),
        child: child,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
    );
  }
}

