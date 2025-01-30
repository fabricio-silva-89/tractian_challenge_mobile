import 'package:flutter/material.dart';

import 'theme.dart';

ThemeData makeThemeData() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.white,
        height: 1.4,
      ),
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey100,
      prefixIconColor: AppColors.grey500,
      hintStyle: AppTextStyles.bodySmall.copyWith(
        height: 1.4,
        color: AppColors.grey500,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      constraints: BoxConstraints(maxHeight: 32),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    chipTheme: ChipThemeData(
      labelStyle: AppTextStyles.titleSmall.copyWith(
        height: 1.4,
        color: AppColors.bodyText2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: BorderSide(color: AppColors.grey200),
      ),
      selectedColor: AppColors.secondary,
      showCheckmark: false,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineSmall: AppTextStyles.headlineSmall,
      headlineMedium: AppTextStyles.headlineMedium,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
    ),
  );
}
