import 'package:flutter/material.dart';
import 'package:toggle_theme/core/config/theme/app_colors.dart';

class CustomColors {
  CustomColors._({required this.secondaryColor});
  final Color secondaryColor;

  factory CustomColors.light() {
    return CustomColors._(secondaryColor: AppColors.primary200);
  }
  factory CustomColors.dark() {
    return CustomColors._(secondaryColor: AppColors.primary0);
  }
}

extension CustomColorsExtension on ThemeData {
  CustomColors get customColors {
    if (brightness == Brightness.dark) return CustomColors.dark();
    return CustomColors.light();
  }
}
