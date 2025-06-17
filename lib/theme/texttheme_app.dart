import 'package:flutter/material.dart';

class AppTheme {
  // A private constructor prevents this class from being instantiated.
  AppTheme._();

  // Your color swatches and schemes remain unchanged.
  static const MaterialColor primarySwatch =
      MaterialColor(_primarySwatchPrimaryValue, <int, Color>{
        50: Color(0xFFE8EEFB),
        100: Color(0xFFCAD7E7),
        200: Color(0xFFADBBCF),
        300: Color(0xFF8FA0B8),
        400: Color(0xFF788CA6),
        500: Color(_primarySwatchPrimaryValue),
        600: Color(0xFF536A84),
        700: Color(0xFF43566D),
        800: Color(0xFF344457),
        900: Color(0xFF222F3F),
      });
  static const int _primarySwatchPrimaryValue = 0xFF617895;

  static final ColorScheme _lightScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: primarySwatch,
    backgroundColor: AppColors.background,
  ).copyWith(
    primary: primarySwatch[900],
    secondary: primarySwatch[500],
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
    error: Colors.red.shade700,
    onError: Colors.white,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    backgroundColor: const Color(0xFF121212),
  ).copyWith(
    primary: primarySwatch[500],
    secondary: primarySwatch[200],
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    surface: const Color(0xFF1E1E1E),
    onSurface: Colors.white,
    error: Colors.red.shade300,
    onError: Colors.black,
  );

  // ==================== NEW DYNAMIC METHODS ====================

  /// Generates the TextTheme for the light theme based on the provided locale.
  ///
  /// It checks if the language is Khmer ('km') and applies specific fonts.
  /// Otherwise, it uses 'Poppins' as the default font.
  static TextTheme _getLightTextTheme(Locale locale) {
    final bool isKhmer = locale.languageCode == 'km';
    final String displayFont = isKhmer ? 'Koulen' : 'Poppins';
    final String bodyFont = isKhmer ? 'Battambang' : 'Poppins';

    return TextTheme(
      headlineLarge: TextStyle(
        fontFamily: displayFont,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: displayFont,
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
      labelLarge: TextStyle( // For buttons
        fontFamily: bodyFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: bodyFont,
        fontSize: 14,
        color: const Color.fromARGB(255, 41, 41, 41),
      ),
      bodySmall: TextStyle(
        fontFamily: bodyFont,
        fontSize: 12,
        color: Colors.black54,
      ),
    );
  }

  /// Generates the TextTheme for the dark theme based on the provided locale.
  static TextTheme _getDarkTextTheme(Locale locale) {
    final bool isKhmer = locale.languageCode == 'km';
    final String displayFont = isKhmer ? 'Koulen' : 'Poppins';
    final String bodyFont = isKhmer ? 'Battambang' : 'Poppins';

    return TextTheme(
      headlineLarge: TextStyle(
        fontFamily: displayFont,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _darkScheme.onSurface,
      ),
      titleLarge: TextStyle(
        fontFamily: displayFont,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _darkScheme.onSurface,
      ),
      labelLarge: TextStyle( // For buttons
        fontFamily: bodyFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _darkScheme.onPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: bodyFont,
        fontSize: 14,
        color: _darkScheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontFamily: bodyFont,
        fontSize: 12,
        color: Colors.white70,
      ),
    );
  }

  /// Returns the complete ThemeData for the light theme, localized for the given locale.
  static ThemeData getLightTheme(Locale locale) {
    final textTheme = _getLightTextTheme(locale);
    final defaultFontFamily = textTheme.bodyMedium?.fontFamily;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: _lightScheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: defaultFontFamily, // Set a default font for the whole app
      textTheme: textTheme, // Provide the localized text theme

      // All your other theme definitions remain the same
      appBarTheme: AppBarTheme(
        backgroundColor: AppTheme.primarySwatch[900],
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        toolbarHeight: 56,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 3,
        shadowColor: AppColors.cardShadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1D61E7),
          foregroundColor: Colors.white,
          minimumSize: const Size(120, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
          textStyle: textTheme.labelLarge,
        ),
      ),
      // ... Add other theme properties here
    );
  }

  /// Returns the complete ThemeData for the dark theme, localized for the given locale.
  static ThemeData getDarkTheme(Locale locale) {
    final textTheme = _getDarkTextTheme(locale);
    final defaultFontFamily = textTheme.bodyMedium?.fontFamily;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: _darkScheme,
      scaffoldBackgroundColor: _darkScheme.surface,
      fontFamily: defaultFontFamily,
      textTheme: textTheme,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.grey,
      ),
      cardTheme: CardThemeData(
        color: _darkScheme.surface,
        elevation: 2,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primarySwatch[400],
          foregroundColor: Colors.black,
          minimumSize: const Size(120, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
          textStyle: textTheme.labelLarge?.copyWith(color: Colors.black),
        ),
      ),
      // ... Add other theme properties here
    );
  }
}


/// AppColors contains the specific color palette for the application.
class AppColors {
  AppColors._();
  static const background = Color(0xFFF5F7FA);
  static const Color cardShadow = Colors.black12;
  // ... your other colors
}