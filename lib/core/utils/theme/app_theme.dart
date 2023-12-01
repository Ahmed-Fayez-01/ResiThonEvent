import 'package:flutter/material.dart';
import '../colors/colors.dart';

ThemeData themeDataLight = ThemeData(
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  primaryColor: AppColors.primarySwatchColor,
  primarySwatch: AppColors.primaryColor,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primarySwatchColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Tajawal",
);
