import 'package:flutter/material.dart';

class TextthemeApp {
  TextthemeApp._();

  static TextTheme getLightTextTheme(Locale locale) {
    bool isKhmer = locale.languageCode == 'km';

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        fontFamily: isKhmer ? 'Koulen' : 'Sans Sara',
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        fontFamily: isKhmer ? 'Koulen' : 'Sans Sara',
        color: Colors.black,
        height: 2.0,
        
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        fontFamily: isKhmer ? 'Battambang' : 'Sans Sara',
        color: Colors.black,
      ),
       bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: isKhmer ? 'Battambang' : 'Sans Sara',
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: isKhmer ? 'Battambang' : 'Sans Sara',
        color: Colors.black,
      ),
    );
  }

  static TextTheme getDarkTextTheme(Locale locale) {
    bool isKhmer = locale.languageCode == 'km';

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        fontFamily: isKhmer ? 'Koulen' : 'Sans Sara',
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        fontFamily: isKhmer ? 'Koulen' : 'Sans Sara',
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: isKhmer ? 'Battambang' : 'Sans Sara',
        color: Colors.white,
      ),
       bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: isKhmer ? 'Battambang' : 'Sans Sara',
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: isKhmer ? 'Battambang' : 'Sans Sara',
        color: Colors.white,
      ),
    );
  }
}
