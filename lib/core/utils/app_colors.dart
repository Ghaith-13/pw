import 'package:flutter/material.dart';
import '../style/colors.dart';

/// Utility class for managing application colors based on themes, states, etc.
class AppColorsUtil {
  /// Returns the appropriate status color based on the provided status
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ordered':
        return AppColors.backgroundStatusOrdered;
      case 'accepted':
        return AppColors.backgroundStatusAccepted;
      case 'ready':
        return AppColors.backgroundStatusReady;
      case 'served':
        return AppColors.backgroundStatusServed;
      default:
        return AppColors.backgroundBlack10;
    }
  }

  /// Returns the appropriate text color based on background color
  static Color getTextColorForBackground(Color backgroundColor) {
    // Determine if the background is dark using a simple luminance calculation
    final double luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;

    return luminance > 0.5 ? AppColors.textBlack100 : AppColors.textWhite100;
  }

  /// Returns semantic colors based on provided semantic type
  static Color getSemanticColor(String type,
      {bool isBackground = true, double opacity = 1.0}) {
    if (isBackground) {
      switch (type.toLowerCase()) {
        case 'success':
        case 'green':
          return opacity == 1.0
              ? AppColors.backgroundSemanticGreen100
              : AppColors.backgroundSemanticGreen20;
        case 'warning':
        case 'yellow':
          return opacity == 1.0
              ? AppColors.backgroundSemanticYellow100
              : AppColors.backgroundSemanticYellow20;
        case 'error':
        case 'red':
          return opacity == 1.0
              ? AppColors.backgroundSemanticRed100
              : AppColors.backgroundSemanticRed20;
        case 'info':
        case 'blue':
          return opacity == 1.0
              ? AppColors.backgroundSemanticBlue100
              : AppColors.backgroundSemanticBlue20;
        default:
          return AppColors.backgroundBlack10;
      }
    } else {
      switch (type.toLowerCase()) {
        case 'success':
        case 'green':
          return AppColors.textSemanticGreen100;
        case 'warning':
        case 'yellow':
        case 'orange':
          return AppColors.textSemanticOrange100;
        case 'error':
        case 'red':
          return AppColors.textSemanticRed100;
        case 'info':
        case 'blue':
          return AppColors.textSemanticBlue100;
        default:
          return AppColors.textBlack100;
      }
    }
  }
}
