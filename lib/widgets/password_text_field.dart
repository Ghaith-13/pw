import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';

/// A custom password text field widget with visibility toggle
///
/// This password field follows the application's design system and
/// provides a toggle to show/hide the password
class AppPasswordTextField extends StatefulWidget {
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

  /// Custom prefix icon
  final Widget? prefixIcon;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Callback when editing is complete
  final VoidCallback? onEditingComplete;

  /// Callback when field is submitted
  final Function(String)? onSubmitted;

  const AppPasswordTextField({
    Key? key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.isRequired = false,
    this.errorText,
    this.isDisabled = false,
    this.onChanged,
    this.prefixIcon,
    this.textInputAction,
    this.focusNode,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool _obscureText = true;

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

        // Password text field
        TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          enabled: !widget.isDisabled,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: widget.textInputAction,
          obscureText: _obscureText,
          maxLines: 1,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
          style: AppTypography.bodyLRegular.copyWith(
            color: widget.isDisabled
                ? AppColors.textBlack40
                : AppColors.textBlack100,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTypography.bodyLRegular.copyWith(
              color: AppColors.textBlack40,
            ),
            errorText: widget.errorText,
            errorStyle: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodySSize,
              fontWeight: AppTypography.regular,
              color: AppColors.textSemanticRed100,
            ),
            filled: true,
            fillColor: widget.isDisabled
                ? AppColors.backgroundBlack10
                : AppColors.backgroundWhite100,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing4,
              vertical: AppSpacing.spacing3,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                _obscureText
                    ? 'assets/icons/EyeInvisible.svg'
                    : 'assets/icons/EyeVisible.svg',
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.iconBlack40,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              splashRadius: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              color: AppColors.iconBlack40,
            ),
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
}
