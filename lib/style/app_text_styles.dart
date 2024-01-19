import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle sideMenuItemSelectedTextStyle({
    required double fontSize,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xff0E77DA),
      );

  static TextStyle sideMenuItemTextStyle({
    required double fontSize,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
}
