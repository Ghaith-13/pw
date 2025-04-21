import 'package:flutter/material.dart';
import 'colors.dart';

class AppTypography {
  // Font families
  static const String fontFamily = 'Inter';

  // Font weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Font sizes
  static const double bodyLSize = 16.0;
  static const double bodyMSize = 14.0;
  static const double bodySSize = 12.0;
  static const double headingLSize = 24.0;
  static const double headingMSize = 20.0;
  static const double headingSSize = 18.0;

  // Line heights
  static const double bodyLHeight = 1.5; // 24/16

  // Text styles
  static final TextStyle bodyLRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: bodyLSize,
    fontWeight: regular,
    height: bodyLHeight,
    color: AppColors.textBlack100,
  );

  static final TextStyle bodyLMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: bodyLSize,
    fontWeight: medium,
    height: bodyLHeight,
    color: AppColors.textBlack100,
  );

  // Add more text styles as needed
}
