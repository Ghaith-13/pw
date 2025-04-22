import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';

/// A custom switch button widget that follows the design guidelines
///
/// This switch button has a teal background when enabled and displays
/// an animated circle thumb that moves between on and off positions
/// It also includes a text label on the left side
class SwitchButton extends StatefulWidget {
  /// Whether the switch is on or off
  final bool value;

  /// Callback when the switch is toggled
  final ValueChanged<bool>? onChanged;

  /// Whether the switch is enabled or disabled
  final bool isEnabled;

  /// Width of the switch, defaults to 52.0
  final double width;

  /// Height of the switch, defaults to 32.0
  final double height;

  /// Custom background color when switch is on
  final Color? activeColor;

  /// Custom background color when switch is off
  final Color? inactiveColor;

  /// Custom thumb color
  final Color? thumbColor;

  /// Text label for the switch
  final String? label;

  /// Text style for the label
  final TextStyle? labelStyle;

  /// Spacing between label and switch
  final double labelSpacing;

  /// Whether to show an asterisk before the label
  final bool showAsterisk;

  const SwitchButton({
    Key? key,
    required this.value,
    this.onChanged,
    this.isEnabled = true,
    this.width = 52.0,
    this.height = 32.0,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.label,
    this.labelStyle,
    this.labelSpacing = 12.0,
    this.showAsterisk = false,
  }) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (widget.value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(SwitchButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.isEnabled;

    // Determine the colors based on state
    final Color activeBackgroundColor = isDisabled
        ? (widget.activeColor ?? AppColors.primary).withOpacity(0.5)
        : widget.activeColor ?? AppColors.primary;

    final Color inactiveBackgroundColor = isDisabled
        ? (widget.inactiveColor ?? Colors.grey.shade300).withOpacity(0.5)
        : widget.inactiveColor ?? Colors.grey.shade300;

    final Color activeThumbColor = isDisabled
        ? (widget.thumbColor ?? Colors.white).withOpacity(0.7)
        : widget.thumbColor ?? Colors.white;

    final switchWidget = GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              if (widget.onChanged != null) {
                widget.onChanged!(!widget.value);
              }
            },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular3,
              color: _animation.value > 0.5
                  ? activeBackgroundColor
                  : inactiveBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                children: [
                  Positioned(
                    left: _animation.value * (widget.width - widget.height + 2),
                    child: Container(
                      width: widget.height - 8, // Account for padding
                      height: widget.height - 8, // Account for padding
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activeThumbColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    // If there's no label, just return the switch
    if (widget.label == null) {
      return switchWidget;
    }

    // Default text style for label
    final TextStyle defaultLabelStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: isDisabled ? Colors.black.withOpacity(0.5) : Colors.black,
    );

    // Build the label widget
    Widget labelWidget = Row(
      children: [
        if (widget.showAsterisk)
          Text(
            '* ',
            style: (widget.labelStyle ?? defaultLabelStyle).copyWith(
              color: Colors.grey,
            ),
          ),
        Text(
          widget.label!,
          style: widget.labelStyle ?? defaultLabelStyle,
        ),
      ],
    );

    // Return the complete widget with label and switch
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        labelWidget,
        SizedBox(width: widget.labelSpacing),
        switchWidget,
      ],
    );
  }
}
