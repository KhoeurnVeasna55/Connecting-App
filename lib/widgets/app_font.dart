import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFonts {
  static TextStyle titleApp({
    required BuildContext context, // Required to access theme colors
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    bool? isBold,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: Theme.of(context).colorScheme.onSurface, 
      fontWeight: isBold == true ? FontWeight.bold : (fontWeight ?? FontWeight.normal),
      fontFamily: fontFamily ?? (Get.locale?.languageCode == 'km' ? 'Koulen' : null), 
      letterSpacing: letterSpacing,
      height: height,
      decoration: isBold == true ? TextDecoration.underline : null,
    );
  }
}
