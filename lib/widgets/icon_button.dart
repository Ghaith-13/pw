import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';

/// A button with an icon (Flutter Icon or custom Widget)
///
/// This button follows the design system with customizable background color,
/// icon color, and rounded corners
class AppIconButton extends StatelessWidget {
  /// The icon to display inside the button (Flutter IconData)
  final IconData? icon;

  /// Widget to use as the icon (for custom icons, including SVG)
  final Widget? iconWidget;

  /// Function to call when the button is pressed
  final VoidCallback onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button should be disabled
  final bool isDisabled;

  /// Size of the button (both width and height)
  final double size;

  /// Size of the icon inside the button
  final double iconSize;

  /// Custom background color for the button
  final Color? backgroundColor;

  /// Custom icon color
  final Color? iconColor;

  /// Whether to show the button with a border instead of filled background
  final bool hasBorder;

  /// Border color when hasBorder is true
  final Color? borderColor;

  /// Border width when hasBorder is true
  final double borderWidth;

  const AppIconButton({
    Key? key,
    this.icon,
    this.iconWidget,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.size = 48.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.iconColor,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth = 1.5,
  })  : assert(icon != null || iconWidget != null,
            'You must provide either an icon or iconWidget'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine button colors based on state
    final Color buttonBackgroundColor;
    final Color buttonIconColor;
    final Color buttonBorderColor;

    if (isDisabled) {
      buttonBackgroundColor =
          hasBorder ? Colors.transparent : AppColors.disabledGrey;
      buttonIconColor =
          hasBorder ? AppColors.disabledGrey : AppColors.iconWhite100;
      buttonBorderColor = AppColors.disabledGrey;
    } else {
      buttonBackgroundColor = hasBorder
          ? Colors.transparent
          : (backgroundColor ?? AppColors.primary);
      buttonIconColor = hasBorder
          ? (iconColor ?? AppColors.primary)
          : (iconColor ?? AppColors.iconWhite100);
      buttonBorderColor = borderColor ?? AppColors.primary;
    }

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: buttonBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circular3,
          side: hasBorder
              ? BorderSide(color: buttonBorderColor, width: borderWidth)
              : BorderSide.none,
        ),
        child: InkWell(
          borderRadius: AppRadius.circular3,
          onTap: isDisabled || isLoading ? null : onPressed,
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: iconSize,
                    width: iconSize,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(hasBorder
                          ? buttonBorderColor
                          : AppColors.iconWhite100),
                    ),
                  )
                : _buildIcon(buttonIconColor),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(Color color) {
    if (icon != null) {
      return Icon(
        icon,
        size: iconSize,
        color: color,
      );
    } else if (iconWidget != null) {
      return SizedBox(
        width: iconSize,
        height: iconSize,
        child: iconWidget!,
      );
    }

    // This should never happen due to the assert in the constructor
    return const SizedBox();
  }
}
