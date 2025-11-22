import 'package:flutter/material.dart';
import 'package:toggle_theme/core/config/theme/app_colors.dart';
import 'package:toggle_theme/core/config/theme/app_text_styles.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary300,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary300,
        foregroundColor: Colors.white,
        disabledBackgroundColor: const Color.fromARGB(255, 56, 55, 55),
        disabledForegroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.headingH6,
        minimumSize: Size(double.infinity, 52),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primary0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xff07371D)),
      ),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.primary200;
        }
        return const Color.fromARGB(255, 56, 55, 55);
      }),
      filled: true,
      hintStyle: AppTextStyles.headingH6.copyWith(color: Colors.white),
    ),
  );
}
