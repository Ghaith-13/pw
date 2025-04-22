import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';

/// A custom text field widget that follows the application's design system
///
/// This text field supports an optional label above the input field
/// and matches the design elements from the design system
class AppTextField extends StatelessWidget {
  /// The controller for the text field
  final TextEditingController? controller;

  /// Optional label text displayed above the text field
  final String? labelText;

  /// Placeholder text when the field is empty
  final String hintText;

  /// Whether the text field is required (shows an asterisk next to label)
  final bool isRequired;

  /// Error text to display below the text field
  final String? errorText;

  /// Whether the field is disabled
  final bool isDisabled;

  /// Callback when text changes
  final Function(String)? onChanged;

  /// Input type for the field
  final TextInputType keyboardType;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Whether to show a clear button when text is entered
  final bool showClearButton;

  /// Custom prefix icon
  final Widget? prefixIcon;

  /// Custom suffix icon
  final Widget? suffixIcon;

  /// Maximum number of lines
  final int? maxLines;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Callback when editing is complete
  final VoidCallback? onEditingComplete;

  /// Callback when field is submitted
  final Function(String)? onSubmitted;

  const AppTextField({
    Key? key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.isRequired = false,
    this.errorText,
    this.isDisabled = false,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.showClearButton = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.textInputAction,
    this.focusNode,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label (if provided)
        if (labelText != null) ...[
          Row(
            children: [
              if (isRequired)
                Text(
                  '* ',
                  style: AppTypography.bodyLMedium.copyWith(
                    color: AppColors.textBlack100,
                    fontWeight: AppTypography.medium,
                  ),
                ),
              Text(
                labelText!,
                style: AppTypography.bodyLMedium.copyWith(
                  color: AppColors.textBlack100,
                  fontWeight: AppTypography.medium,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing2),
        ],

        // Text field
        TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: !isDisabled,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          maxLines: maxLines,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          style: AppTypography.bodyLRegular.copyWith(
            color: isDisabled ? AppColors.textBlack40 : AppColors.textBlack100,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypography.bodyLRegular.copyWith(
              color: AppColors.textBlack40,
            ),
            errorText: errorText,
            errorStyle: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodySSize,
              fontWeight: AppTypography.regular,
              color: AppColors.textSemanticRed100,
            ),
            filled: true,
            fillColor: isDisabled
                ? AppColors.backgroundBlack10
                : AppColors.backgroundWhite100,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing4,
              vertical: AppSpacing.spacing3,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: buildSuffixIcon(),
            border: OutlineInputBorder(
              borderRadius: AppRadius.circular3,
              borderSide: BorderSide(
                color: AppColors.borderBlack10,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.circular3,
              borderSide: BorderSide(
                color: AppColors.borderBlack10,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadius.circular3,
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppRadius.circular3,
              borderSide: BorderSide(
                color: AppColors.textSemanticRed100,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppRadius.circular3,
              borderSide: BorderSide(
                color: AppColors.textSemanticRed100,
                width: 1.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.circular3,
              borderSide: BorderSide(
                color: AppColors.borderBlack10,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? buildSuffixIcon() {
    if (showClearButton && controller != null && controller!.text.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          controller!.clear();
          if (onChanged != null) {
            onChanged!('');
          }
        },
        child: Icon(
          Icons.clear,
          color: AppColors.iconBlack40,
          size: 20,
        ),
      );
    }

    return suffixIcon;
  }
}
