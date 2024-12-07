import 'package:flutter/material.dart';

class AppTheme {
// Light Theme
  ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
    ),
  );

// Dark Theme
  ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade800,
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade700,
      tertiary: Colors.black,
      inversePrimary: Colors.grey.shade200,
    ),
  );
}
