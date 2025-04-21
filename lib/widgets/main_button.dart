import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';

/// A primary action button used throughout the application
///
/// This button follows the main design language with teal background,
/// white text, and rounded corners
class MainButton extends StatelessWidget {
  /// The text to display inside the button
  final String text;

  /// Icon to display before the text (optional)
  final IconData? leadingIcon;

  /// Icon to display after the text (optional)
  final IconData? trailingIcon;

  /// Function to call when the button is pressed
  final VoidCallback onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button should be disabled
  final bool isDisabled;

  /// Custom color for the button (optional)
  final Color? backgroundColor;

  /// Custom text color (optional)
  final Color? textColor;

  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine button color based on state
    final Color buttonColor;
    if (isDisabled) {
      buttonColor = AppColors.disabledGrey; // Grey for disabled state
    } else {
      buttonColor = backgroundColor ?? AppColors.primary;
    }

    final labelColor = textColor ?? AppColors.textWhite100;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled || isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: labelColor,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing6,
            vertical: AppSpacing.spacing3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                AppRadius.circular3, // This is 16px based on radius.dart
          ),
          elevation: 0,
          disabledBackgroundColor:
              isDisabled ? buttonColor : buttonColor.withOpacity(0.6),
          disabledForegroundColor: labelColor.withOpacity(0.8),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.textWhite100),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leadingIcon != null) ...[
                    Icon(leadingIcon, size: 20),
                    const SizedBox(width: AppSpacing.spacing2),
                  ],
                  Text(
                    text,
                    style: AppTypography.bodyLMedium.copyWith(
                      color: labelColor,
                      fontWeight: AppTypography.semiBold,
                    ),
                  ),
                  if (trailingIcon != null) ...[
                    const SizedBox(width: AppSpacing.spacing2),
                    Icon(trailingIcon, size: 20),
                  ],
                ],
              ),
      ),
    );
  }
}
