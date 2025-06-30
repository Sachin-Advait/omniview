import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omniview/config/theme/app_colors.dart';

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.deepNavy,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.white),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700, // Bold
      ),
      headlineSmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600, // SemiBold
      ),
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500, // Medium
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400, // Regular
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 11,
        fontWeight: FontWeight.w300, // Light
      ),
    ),
  );
}

extension AppTextStyles on BuildContext {
  TextStyle get extraBold => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get bold => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get semiBold => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get medium => Theme.of(this).textTheme.titleLarge!;
  TextStyle get regular => Theme.of(this).textTheme.titleMedium!;
  TextStyle get light => Theme.of(this).textTheme.titleSmall!;
}
