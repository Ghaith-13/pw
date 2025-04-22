import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';

/// A custom search field widget that follows the application's design system
///
/// This search field is designed based on the Figma design and includes
/// a search icon prefix and placeholder text.
class AppSearchField extends StatelessWidget {
  /// The controller for the search field
  final TextEditingController? controller;

  /// Placeholder text when the field is empty
  final String hintText;

  /// Whether the field is disabled
  final bool isDisabled;

  /// Callback when text changes
  final Function(String)? onChanged;

  /// Callback when search is submitted
  final Function(String)? onSubmitted;

  /// Focus node for the search field
  final FocusNode? focusNode;

  /// Custom suffix icon (optional)
  final Widget? suffixIcon;

  const AppSearchField({
    Key? key,
    this.controller,
    this.hintText = 'Search',
    this.isDisabled = false,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      enabled: !isDisabled,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: AppTypography.bodyLRegular.copyWith(
        color: isDisabled ? AppColors.textBlack40 : AppColors.textBlack100,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTypography.bodyLRegular.copyWith(
          color: AppColors.textBlack40,
        ),
        filled: true,
        fillColor: isDisabled
            ? AppColors.backgroundBlack10
            : AppColors.backgroundWhite100,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing4,
          vertical: AppSpacing.spacing3,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: AppSpacing.spacing4,
            right: AppSpacing.spacing2,
          ),
          child: Icon(
            Icons.search,
            color: AppColors.iconBlack40,
            size: 18,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(25.0), // Based on the Figma design
          borderSide: BorderSide(
            color: Color(0x1A2B3F3D), // 10% opacity of #2B3F3D as per JSON
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(0x1A2B3F3D), // 10% opacity of #2B3F3D as per JSON
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(0x1A2B3F3D), // 10% opacity of #2B3F3D as per JSON
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
