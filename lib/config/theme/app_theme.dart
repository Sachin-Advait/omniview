import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardTheme: CardThemeData(color: AppColors.darkCard),
    canvasColor: AppColors.white,
    hintColor: AppColors.white75,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      iconTheme: IconThemeData(color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    cardColor: AppColors.darkCard,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.white),
    dividerColor: AppColors.white50,
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardTheme: CardThemeData(color: AppColors.lightCard),
    canvasColor: AppColors.black,
    hintColor: AppColors.black75,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      iconTheme: IconThemeData(color: AppColors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    cardColor: AppColors.lightCard,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: AppColors.black,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.black),
    dividerColor: AppColors.white50,
  );
}

/// TextStyle extensions for ease
extension AppTextStyles on BuildContext {
  TextStyle get extraBold => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get bold => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get semiBold => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get medium => Theme.of(this).textTheme.titleLarge!;
  TextStyle get regular => Theme.of(this).textTheme.titleMedium!;
  TextStyle get light => Theme.of(this).textTheme.titleSmall!;
}
