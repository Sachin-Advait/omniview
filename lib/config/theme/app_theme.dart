import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omniview/config/theme/app_colors.dart';

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.black, fontSize: 24),
      headlineMedium: TextStyle(color: AppColors.black, fontSize: 20),
      headlineSmall: TextStyle(color: AppColors.black, fontSize: 18),
      titleLarge: TextStyle(color: AppColors.black, fontSize: 16),
      titleMedium: TextStyle(color: AppColors.black, fontSize: 14),
      titleSmall: TextStyle(color: AppColors.black, fontSize: 12),
    ),
  );
}
