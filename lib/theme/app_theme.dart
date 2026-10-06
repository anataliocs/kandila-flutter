import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPink = Color(0xFFFFD1DC);
  static const Color seafoamGreen = Color(0xFFA3E4D7);
  static const Color lavender = Color(0xFFE6E6FA);
  static const Color pastelBlue = Color(0xFFAEC6CF);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: lavender,
        primary: lavender,
        secondary: seafoamGreen,
        tertiary: lightPink,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: lavender,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: pastelBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: seafoamGreen, width: 2),
        ),
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Colors.black87),
      ),
    );
  }
}
