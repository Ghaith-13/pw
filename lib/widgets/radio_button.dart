import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/typography.dart';

/// A custom radio button widget that follows the design guidelines
///
/// This radio button displays text on the left and the radio button on the right.
/// It supports customization of colors, size, and text styling.
class CustomRadioButton<T> extends StatelessWidget {
  /// The currently selected value for the radio group
  final T groupValue;

  /// The value this radio button represents
  final T value;

  /// Callback when this radio button is selected
  final ValueChanged<T>? onChanged;

  /// Whether the radio button is enabled or disabled
  final bool isEnabled;

  /// Size of the radio button, defaults to 24.0 to match the design
  final double size;

  /// Custom background color when radio button is selected
  final Color? activeColor;

  /// Custom border color when radio button is unselected
  final Color? borderColor;

  /// Custom check icon color
  final Color? checkColor;

  /// Text label for the radio button
  final String label;

  /// Text style for the label
  final TextStyle? labelStyle;

  /// Spacing between label and radio button
  final double labelSpacing;

  const CustomRadioButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.label,
    this.onChanged,
    this.isEnabled = true,
    this.size = 24.0,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.labelStyle,
    this.labelSpacing = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    final bool isDisabled = !isEnabled;

    // Determine colors based on state
    final Color activeBackgroundColor = isDisabled
        ? (activeColor ?? AppColors.primary).withOpacity(0.5)
        : activeColor ?? AppColors.primary;

    final Color inactiveBorderColor = isDisabled
        ? (borderColor ?? Colors.grey.shade300).withOpacity(0.5)
        : borderColor ?? Colors.grey.shade300;

    final Color checkIconColor = isDisabled
        ? (checkColor ?? Colors.white).withOpacity(0.7)
        : checkColor ?? Colors.white;

    // Default text style for label
    final TextStyle defaultLabelStyle = labelStyle ??
        AppTypography.bodyLRegular.copyWith(
          color: isDisabled ? AppColors.textBlack60 : AppColors.textBlack100,
        );

    // Creating the radio button widget
    final radioWidget = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? activeBackgroundColor : Colors.transparent,
        border: Border.all(
          color: isSelected ? activeBackgroundColor : inactiveBorderColor,
          width: 1.5,
        ),
      ),
      child: isSelected
          ? Center(
              child: Icon(
                Icons.check,
                size: size * 0.7,
                color: checkIconColor,
              ),
            )
          : null,
    );

    return GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              if (onChanged != null) {
                onChanged!(value);
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
                label,
                style: defaultLabelStyle,
              ),
            ),

            // Radio button on the right
            radioWidget,
          ],
        ),
      ),
    );
  }
}

/// A group of custom radio buttons that work together
///
/// This widget makes it easy to create a group of radio buttons
/// that share the same selection state.
class CustomRadioGroup<T> extends StatefulWidget {
  /// List of values for each radio button
  final List<T> values;

  /// List of labels for each radio button
  final List<String> labels;

  /// Initial selected value
  final T initialValue;

  /// Callback when selection changes
  final ValueChanged<T>? onChanged;

  /// Whether the radio buttons are enabled
  final bool isEnabled;

  /// Custom background color for selected radio buttons
  final Color? activeColor;

  /// Custom border color for unselected radio buttons
  final Color? borderColor;

  /// Custom check icon color
  final Color? checkColor;

  /// Size of the radio buttons
  final double size;

  /// Text style for the labels
  final TextStyle? labelStyle;

  /// Spacing between radio buttons
  final double spacing;

  const CustomRadioGroup({
    Key? key,
    required this.values,
    required this.labels,
    required this.initialValue,
    this.onChanged,
    this.isEnabled = true,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.size = 24.0,
    this.labelStyle,
    this.spacing = 12.0,
  })  : assert(values.length == labels.length,
            'Values and labels must have the same length'),
        super(key: key);

  @override
  State<CustomRadioGroup<T>> createState() => _CustomRadioGroupState<T>();
}

class _CustomRadioGroupState<T> extends State<CustomRadioGroup<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        widget.values.length,
        (index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: index < widget.values.length - 1 ? widget.spacing : 0),
            child: CustomRadioButton<T>(
              groupValue: _selectedValue,
              value: widget.values[index],
              label: widget.labels[index],
              onChanged: widget.isEnabled
                  ? (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    }
                  : null,
              isEnabled: widget.isEnabled,
              activeColor: widget.activeColor,
              borderColor: widget.borderColor,
              checkColor: widget.checkColor,
              size: widget.size,
              labelStyle: widget.labelStyle,
            ),
          );
        },
      ),
    );
  }
}
