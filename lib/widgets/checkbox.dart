import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/typography.dart';

/// A custom checkbox widget that follows the design guidelines
///
/// This checkbox supports customization of colors, size, and includes
/// a text label. It displays the text on the left and checkbox on the right.
class CustomCheckbox extends StatefulWidget {
  /// Whether the checkbox is checked
  final bool value;

  /// Callback when the checkbox is toggled
  final ValueChanged<bool>? onChanged;

  /// Whether the checkbox is enabled or disabled
  final bool isEnabled;

  /// Size of the checkbox, defaults to 24.0
  final double size;

  /// Custom background color when checkbox is checked
  final Color? activeColor;

  /// Custom border color when checkbox is unchecked
  final Color? borderColor;

  /// Custom check icon color
  final Color? checkColor;

  /// Text label for the checkbox
  final String? label;

  /// Text style for the label
  final TextStyle? labelStyle;

  /// Spacing between label and checkbox
  final double labelSpacing;

  const CustomCheckbox({
    Key? key,
    required this.value,
    this.onChanged,
    this.isEnabled = true,
    this.size = 24.0,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.label,
    this.labelStyle,
    this.labelSpacing = 12.0,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.isEnabled;

    // Determine the colors based on state
    final Color activeBackgroundColor = isDisabled
        ? (widget.activeColor ?? AppColors.primary).withOpacity(0.5)
        : widget.activeColor ?? AppColors.primary;

    final Color activeBorderColor = activeBackgroundColor;

    final Color inactiveBorderColor = isDisabled
        ? (widget.borderColor ?? Colors.grey.shade300).withOpacity(0.5)
        : widget.borderColor ?? Colors.grey.shade300;

    final Color checkIconColor = isDisabled
        ? (widget.checkColor ?? Colors.white).withOpacity(0.7)
        : widget.checkColor ?? Colors.white;

    // Default text style for label
    final TextStyle defaultLabelStyle = widget.labelStyle ??
        AppTypography.bodyLRegular.copyWith(
          color: isDisabled ? Colors.black.withOpacity(0.5) : Colors.black,
        );

    // Creating the checkbox widget
    final checkboxWidget = Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(4.0), // Light radius to match screenshot
        color: widget.value ? activeBackgroundColor : Colors.transparent,
        border: Border.all(
          color: widget.value ? activeBorderColor : inactiveBorderColor,
          width: 1.5,
        ),
      ),
      child: widget.value
          ? Center(
              child: Icon(
                Icons.check,
                size: widget.size * 0.7,
                color: checkIconColor,
              ),
            )
          : null,
    );

    return GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              if (widget.onChanged != null) {
                widget.onChanged!(!widget.value);
              }
            },
      child: Container(
        color: Colors.transparent, // For tap area
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text on the left
            Expanded(
              child: Text(
                widget.label ?? '',
                style: defaultLabelStyle,
              ),
            ),

            // Checkbox on the right
            checkboxWidget,
          ],
        ),
      ),
    );
  }
}
