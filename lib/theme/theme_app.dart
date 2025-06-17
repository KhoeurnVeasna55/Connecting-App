import 'package:flutter/material.dart';

class ThemeAppMode {
  ThemeAppMode._();

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.light,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.dark,
  );

  static ThemeData getTheme(Locale locale, bool isDarkMode) {
    final bool isKhmer = locale.languageCode == 'km';
    final String displayFont = isKhmer ? 'Koulen' : 'Sans Sara';
    final String bodyFont = isKhmer ? 'Battambang' : 'Sans Sara';

    final textTheme = const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
        .apply(
          fontFamily: bodyFont,
          displayColor: isDarkMode ? Colors.white : Colors.black,
          bodyColor: isDarkMode ? Colors.white : Colors.black,
        )
        .copyWith(
          headlineLarge: TextStyle(fontFamily: displayFont),
          titleLarge: TextStyle(fontFamily: displayFont),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorScheme: isDarkMode ? _darkScheme : _lightScheme,
      fontFamily: bodyFont,
      textTheme: textTheme,

      scaffoldBackgroundColor:
          isDarkMode ? const Color(0xFF121212) : Colors.white,

      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor:
            isDarkMode ? _darkScheme.surface : _lightScheme.primary,
        foregroundColor:
            isDarkMode ? _darkScheme.onSurface : _lightScheme.onPrimary,
      ),

      cardTheme: CardThemeData(
        elevation: 2,
        color: isDarkMode ? _darkScheme.surface : _lightScheme.surface,
        shadowColor: isDarkMode ? Colors.black45 : Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        hintStyle: TextStyle(color: Colors.grey.shade600),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isDarkMode ? _darkScheme.primary : _lightScheme.primary,
          foregroundColor:
              isDarkMode ? _darkScheme.onPrimary : _lightScheme.onPrimary,
          minimumSize: const Size(120, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
    );
  }
}
