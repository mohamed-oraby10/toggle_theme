import 'package:flutter/material.dart';
import 'package:toggle_theme/core/config/theme/extensions/custom_colors_extension.dart';

extension ThemeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  CustomColors get customColors => Theme.of(this).customColors;
}
