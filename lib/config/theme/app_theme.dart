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
        fontSize: 24,
        fontWeight: FontWeight.w900, // ExtraBold
      ),
      headlineMedium: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800, // Bold
      ),
      headlineSmall: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700, // SemiBold
      ),
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500, // Medium
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w300, // Light
      ),
    ),
  );
}
