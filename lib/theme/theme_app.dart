import 'package:flutter/material.dart';
import 'texttheme_app.dart';

class ThemeAppMode {
  ThemeAppMode._();

  static ThemeData getTheme(Locale locale, bool isDarkMode) {
    bool isKhmer = locale.languageCode == 'km';

    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: Colors.blueAccent,
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      shadowColor: isDarkMode
          ? Colors.white.withValues(alpha: 0.2)
          : Colors.black.withValues(alpha: 0.2),
      fontFamily: isKhmer ? 'Battambang' : 'Sans Sara',
      textTheme: isDarkMode
          ? TextthemeApp.getDarkTextTheme(locale)
          : TextthemeApp.getLightTextTheme(locale),
    );
  }
}
