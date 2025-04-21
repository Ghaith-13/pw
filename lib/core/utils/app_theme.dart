import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/radius.dart';
import '../style/spacing.dart';
import '../style/typography.dart';

/// Utility class for managing application themes
class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.backgroundBlack100,
      onPrimary: AppColors.textWhite100,
      secondary: AppColors.backgroundSemanticBlue100,
      onSecondary: AppColors.textWhite100,
      error: AppColors.backgroundSemanticRed100,
      onError: AppColors.textWhite100,
      background: AppColors.backgroundWhite100,
      onBackground: AppColors.textBlack100,
      surface: AppColors.backgroundWhite100,
      onSurface: AppColors.textBlack100,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTypography.bodyLRegular,
      bodyMedium: AppTypography.bodyLMedium,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundWhite100,
      foregroundColor: AppColors.textBlack100,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.backgroundBlack100,
        foregroundColor: AppColors.textWhite100,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing4,
          vertical: AppSpacing.spacing2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circular3,
        ),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textBlack100,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing4,
          vertical: AppSpacing.spacing2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circular3,
        ),
        side: const BorderSide(color: AppColors.borderBlack100),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textBlack100,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing2,
          vertical: AppSpacing.spacing1,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.backgroundWhite100,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular3,
      ),
      margin: const EdgeInsets.all(AppSpacing.spacing2),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.backgroundWhite100,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing4,
        vertical: AppSpacing.spacing3,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.circular3,
        borderSide: const BorderSide(color: AppColors.borderBlack10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.circular3,
        borderSide: const BorderSide(color: AppColors.borderBlack10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.circular3,
        borderSide: const BorderSide(color: AppColors.borderBlack100),
      ),
    ),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.backgroundWhite100,
      onPrimary: AppColors.textBlack100,
      secondary: AppColors.backgroundSemanticBlue100,
      onSecondary: AppColors.textWhite100,
      error: AppColors.backgroundSemanticRed100,
      onError: AppColors.textWhite100,
      background: AppColors.backgroundBlack100,
      onBackground: AppColors.textWhite100,
      surface: AppColors.backgroundBlack100,
      onSurface: AppColors.textWhite100,
    ),
    textTheme: TextTheme(
      bodyLarge:
          AppTypography.bodyLRegular.copyWith(color: AppColors.textWhite100),
      bodyMedium:
          AppTypography.bodyLMedium.copyWith(color: AppColors.textWhite100),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundBlack100,
      foregroundColor: AppColors.textWhite100,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.backgroundWhite100,
        foregroundColor: AppColors.textBlack100,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing4,
          vertical: AppSpacing.spacing2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circular3,
        ),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textWhite100,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing4,
          vertical: AppSpacing.spacing2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circular3,
        ),
        side: const BorderSide(color: AppColors.borderBlack10),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textWhite100,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing2,
          vertical: AppSpacing.spacing1,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular3,
      ),
      margin: const EdgeInsets.all(AppSpacing.spacing2),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFF1E1E1E),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing4,
        vertical: AppSpacing.spacing3,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.circular3,
        borderSide: const BorderSide(color: AppColors.borderBlack10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.circular3,
        borderSide: const BorderSide(color: AppColors.borderBlack10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.circular3,
        borderSide: const BorderSide(color: AppColors.borderBlack100),
      ),
    ),
  );
}
