import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';

/// A circular close button with an X icon
///
/// This button follows the design system with a circular shape
/// and an X icon for closing/dismissing content
class AppCloseButton extends StatelessWidget {
  /// Function to call when the button is pressed
  final VoidCallback onPressed;

  /// Size of the button (both width and height)
  final double size;

  /// Color of the button background
  final Color? backgroundColor;

  /// Color of the X icon
  final Color? iconColor;

  /// Whether the button should have a border instead of a filled background
  final bool hasBorder;

  /// Border color when hasBorder is true
  final Color? borderColor;

  /// Border width when hasBorder is true
  final double borderWidth;

  const AppCloseButton({
    Key? key,
    required this.onPressed,
    this.size = 40.0,
    this.backgroundColor,
    this.iconColor,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine button colors
    final Color buttonBackgroundColor = hasBorder
        ? Colors.transparent
        : (backgroundColor ?? AppColors.backgroundWhite100);
    final Color buttonIconColor = iconColor ?? AppColors.iconBlack100;
    final Color buttonBorderColor = borderColor ?? AppColors.borderBlack10;

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: buttonBackgroundColor,
        shape: CircleBorder(
          side: hasBorder
              ? BorderSide(color: buttonBorderColor, width: borderWidth)
              : BorderSide.none,
        ),
        elevation: 0,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Center(
            child: Icon(
              Icons.close,
              size: size * 0.5,
              color: buttonIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
