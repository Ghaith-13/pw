import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';

/// A PIN field widget that displays circular fields for PIN entry
///
/// This widget renders a row of circular PIN entry fields that match
/// the design from the Figma design (pin_field.json)
class AppPinField extends StatefulWidget {
  /// The number of PIN digits to display
  final int length;

  /// Optional label displayed above the PIN field
  final String? labelText;

  /// Whether the PIN field is required (shows an asterisk next to label)
  final bool isRequired;

  /// Error text to display below the PIN field
  final String? errorText;

  /// Whether the field is disabled
  final bool isDisabled;

  /// Callback when PIN is complete
  final ValueChanged<String>? onCompleted;

  /// Callback when PIN changes
  final ValueChanged<String>? onChanged;

  /// Obscure the PIN entry (show dots instead of numbers)
  final bool obscureText;

  /// Size of each PIN circle
  final double pinSize;

  /// Focus node for the PIN field
  final FocusNode? focusNode;

  const AppPinField({
    Key? key,
    this.length = 6,
    this.labelText,
    this.isRequired = false,
    this.errorText,
    this.isDisabled = false,
    this.onCompleted,
    this.onChanged,
    this.obscureText = false,
    this.pinSize = 48.0,
    this.focusNode,
  }) : super(key: key);

  @override
  State<AppPinField> createState() => _AppPinFieldState();
}

class _AppPinFieldState extends State<AppPinField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late String _pin;

  @override
  void initState() {
    super.initState();
    _pin = '';
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onPinChanged() {
    _pin = _controllers.map((controller) => controller.text).join();
    if (widget.onChanged != null) {
      widget.onChanged!(_pin);
    }

    if (_pin.length == widget.length && widget.onCompleted != null) {
      widget.onCompleted!(_pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label (if provided)
        if (widget.labelText != null) ...[
          Row(
            children: [
              if (widget.isRequired)
                Text(
                  '* ',
                  style: AppTypography.bodyLMedium.copyWith(
                    color: AppColors.textBlack100,
                    fontWeight: AppTypography.medium,
                  ),
                ),
              Text(
                widget.labelText!,
                style: AppTypography.bodyLMedium.copyWith(
                  color: AppColors.textBlack100,
                  fontWeight: AppTypography.medium,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing2),
        ],

        // PIN field
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            widget.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < widget.length - 1
                    ? AppSpacing.spacing3
                    : 0, // Reduced spacing between pins
              ),
              child: _buildPinField(index),
            ),
          ),
        ),

        // Error text
        if (widget.errorText != null) ...[
          SizedBox(height: AppSpacing.spacing1),
          Text(
            widget.errorText!,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodySSize,
              fontWeight: AppTypography.regular,
              color: AppColors.textSemanticRed100,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPinField(int index) {
    return Container(
      width: widget.pinSize,
      height: widget.pinSize,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite100,
        shape: BoxShape.circle,
        border: Border.all(
          color: _getBorderColor(index),
          width: 2.0,
        ),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          enabled: !widget.isDisabled,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          obscureText: widget.obscureText,
          maxLength: 1,
          style: AppTypography.bodyLMedium.copyWith(
            color: widget.isDisabled
                ? AppColors.textBlack40
                : AppColors.textBlack100,
            fontWeight: AppTypography.medium,
          ),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {
            if (value.isNotEmpty) {
              // Move focus to next field
              if (index < widget.length - 1) {
                _focusNodes[index + 1].requestFocus();
              } else {
                _focusNodes[index].unfocus();
              }
            }
            _onPinChanged();
          },
          onTap: () {
            // Select all text when tapped
            _controllers[index].selection = TextSelection(
                baseOffset: 0, extentOffset: _controllers[index].text.length);
          },
        ),
      ),
    );
  }

  Color _getBorderColor(int index) {
    if (widget.errorText != null) {
      return AppColors.textSemanticRed100;
    }

    if (widget.isDisabled) {
      return AppColors.borderBlack10;
    }

    if (_focusNodes[index].hasFocus) {
      return AppColors.primary;
    }

    // This matches the stroke color in the Figma design (#f1f2f4)
    return AppColors.borderBlack10;
  }
}
