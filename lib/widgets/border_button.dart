import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';

/// A button with a border outline and transparent background
///
/// This button follows the design language with a teal border,
/// teal text, and rounded corners
class BorderButton extends StatelessWidget {
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

  /// Custom border color (optional)
  final Color? borderColor;

  /// Custom text color (optional)
  final Color? textColor;

  const BorderButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine button colors based on state
    final Color buttonBorderColor;
    final Color buttonTextColor;

    if (isDisabled) {
      buttonBorderColor = AppColors.disabledGrey;
      buttonTextColor = AppColors.disabledGrey;
    } else {
      buttonBorderColor = borderColor ?? AppColors.primary;
      buttonTextColor = textColor ?? AppColors.primary;
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isDisabled || isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: buttonTextColor,
          side: BorderSide(
            color: buttonBorderColor,
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing6,
            vertical: AppSpacing.spacing3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                AppRadius.circular3, // This is 16px based on radius.dart
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          disabledForegroundColor: buttonTextColor.withOpacity(0.6),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(buttonTextColor),
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
                      color: buttonTextColor,
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
