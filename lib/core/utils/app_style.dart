import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/radius.dart';
import '../style/shadows.dart';
import '../style/spacing.dart';
import '../style/typography.dart';

/// Utility class that combines all style elements for easy access
class AppStyle {
  // Common button styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
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
  );

  static ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: AppColors.textBlack100,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacing4,
      vertical: AppSpacing.spacing2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.circular3,
    ),
    side: const BorderSide(color: AppColors.borderBlack100),
  );

  // Common card styles
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.backgroundWhite100,
    borderRadius: AppRadius.circular3,
    boxShadow: const [AppShadows.smallShadow],
  );

  static BoxDecoration elevatedCardDecoration = BoxDecoration(
    color: AppColors.backgroundWhite100,
    borderRadius: AppRadius.circular3,
    boxShadow: const [AppShadows.mediumShadow],
  );

  // Common input decoration
  static InputDecoration inputDecoration = InputDecoration(
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
  );

  // Status styles
  static BoxDecoration getStatusDecoration(String status) {
    Color backgroundColor;

    switch (status.toLowerCase()) {
      case 'ordered':
        backgroundColor = AppColors.backgroundStatusOrdered;
        break;
      case 'accepted':
        backgroundColor = AppColors.backgroundStatusAccepted;
        break;
      case 'ready':
        backgroundColor = AppColors.backgroundStatusReady;
        break;
      case 'served':
        backgroundColor = AppColors.backgroundStatusServed;
        break;
      default:
        backgroundColor = AppColors.backgroundBlack10;
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: AppRadius.circular3,
    );
  }
}
