import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';
import 'close_button.dart';
import 'text_field.dart';
import 'password_text_field.dart';
import 'main_button.dart';
import 'border_button.dart';

/// A custom bottom sheet that follows the application's design system
///
/// This bottom sheet can be used for various forms and dialogs in the app
class AppBottomSheet extends StatelessWidget {
  /// The title of the bottom sheet
  final String title;

  /// The content widgets to be displayed in the bottom sheet
  final List<Widget> children;

  /// Primary action button text
  final String? primaryButtonText;

  /// Primary action button callback
  final VoidCallback? onPrimaryButtonPressed;

  /// Secondary action button text
  final String? secondaryButtonText;

  /// Secondary action button callback
  final VoidCallback? onSecondaryButtonPressed;

  /// Whether primary button is in loading state
  final bool isPrimaryButtonLoading;

  /// Whether primary button is disabled
  final bool isPrimaryButtonDisabled;

  /// Bottom padding to account for safe area
  final double bottomPadding;

  /// Whether to show the close button
  final bool showCloseButton;

  /// Callback when the sheet is dismissed
  final VoidCallback? onDismissed;

  const AppBottomSheet({
    Key? key,
    required this.title,
    required this.children,
    this.primaryButtonText,
    this.onPrimaryButtonPressed,
    this.secondaryButtonText,
    this.onSecondaryButtonPressed,
    this.isPrimaryButtonLoading = false,
    this.isPrimaryButtonDisabled = false,
    this.bottomPadding = 0,
    this.showCloseButton = true,
    this.onDismissed,
  }) : super(key: key);

  /// Static method to show the bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required List<Widget> children,
    String? primaryButtonText,
    VoidCallback? onPrimaryButtonPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryButtonPressed,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonDisabled = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showCloseButton = true,
    VoidCallback? onDismissed,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AppBottomSheet(
          title: title,
          children: children,
          primaryButtonText: primaryButtonText,
          onPrimaryButtonPressed: onPrimaryButtonPressed,
          secondaryButtonText: secondaryButtonText,
          onSecondaryButtonPressed: onSecondaryButtonPressed,
          isPrimaryButtonLoading: isPrimaryButtonLoading,
          isPrimaryButtonDisabled: isPrimaryButtonDisabled,
          bottomPadding: MediaQuery.of(context).viewPadding.bottom,
          showCloseButton: showCloseButton,
          onDismissed: onDismissed,
        );
      },
    ).then((value) {
      if (onDismissed != null) {
        onDismissed();
      }
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppSpacing.spacing8, // 40.0
      ),
      padding: EdgeInsets.only(bottom: bottomPadding),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadius.round3),
          topRight: Radius.circular(AppRadius.round3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spacing4), // 16.0
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: AppTypography.headingMSize,
                      fontWeight: AppTypography.bold,
                      color: AppColors.textBlack100,
                    ),
                  ),
                ),
                if (showCloseButton)
                  AppCloseButton(
                    onPressed: () => Navigator.of(context).pop(),
                    size: 40.0,
                    backgroundColor: const Color.fromARGB(103, 183, 188, 192),
                    iconColor: AppColors.iconBlack100,
                  ),
              ],
            ),

            SizedBox(height: AppSpacing.spacing4), // 16.0

            // Content area
            ...children,

            // Optional action buttons
            if (primaryButtonText != null || secondaryButtonText != null)
              SizedBox(height: AppSpacing.spacing4), // 16.0

            // Primary button
            if (primaryButtonText != null)
              MainButton(
                text: primaryButtonText!,
                onPressed: onPrimaryButtonPressed ?? () {},
                isLoading: isPrimaryButtonLoading,
                isDisabled: isPrimaryButtonDisabled,
              ),

            // Secondary button with spacing
            if (secondaryButtonText != null) ...[
              SizedBox(height: AppSpacing.spacing2), // 8.0
              BorderButton(
                text: secondaryButtonText!,
                onPressed: onSecondaryButtonPressed ?? () {},
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A specialized bottom sheet for adding roles
///
/// This bottom sheet includes a text field for role name
/// and a dropdown for role type
class AddRoleBottomSheet extends StatefulWidget {
  /// Callback when a role is added
  final Function(String name, String type) onRoleAdded;

  /// Whether the bottom sheet is in loading state
  final bool isLoading;

  const AddRoleBottomSheet({
    Key? key,
    required this.onRoleAdded,
    this.isLoading = false,
  }) : super(key: key);

  /// Static method to show the add role bottom sheet
  static Future<void> show({
    required BuildContext context,
    required Function(String name, String type) onRoleAdded,
    bool isLoading = false,
  }) async {
    return AppBottomSheet.show(
      context: context,
      title: 'Add Role',
      children: [
        _AddRoleContent(
          onRoleAdded: onRoleAdded,
          isLoading: isLoading,
        ),
      ],
      isDismissible: true,
      enableDrag: true,
    );
  }

  @override
  State<AddRoleBottomSheet> createState() => _AddRoleBottomSheetState();
}

class _AddRoleBottomSheetState extends State<AddRoleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return _AddRoleContent(
      onRoleAdded: widget.onRoleAdded,
      isLoading: widget.isLoading,
    );
  }
}

class _AddRoleContent extends StatefulWidget {
  final Function(String name, String type) onRoleAdded;
  final bool isLoading;

  const _AddRoleContent({
    Key? key,
    required this.onRoleAdded,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<_AddRoleContent> createState() => _AddRoleContentState();
}

class _AddRoleContentState extends State<_AddRoleContent> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedRoleType = 'Creator';
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _nameController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Role Name TextField
        AppTextField(
          controller: _nameController,
          labelText: 'Role Name',
          hintText: 'Developer',
          isRequired: true,
        ),

        SizedBox(height: AppSpacing.spacing4), // 16.0

        // Role Type Dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '* ',
                  style: AppTypography.bodyLMedium.copyWith(
                    color: AppColors.textBlack100,
                    fontWeight: AppTypography.medium,
                  ),
                ),
                Text(
                  'Role Type',
                  style: AppTypography.bodyLMedium.copyWith(
                    color: AppColors.textBlack100,
                    fontWeight: AppTypography.medium,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacing.spacing2), // 8.0

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderBlack10,
                  width: 1.0,
                ),
                borderRadius: AppRadius.circular3,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedRoleType,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 0,
                  style: AppTypography.bodyLRegular.copyWith(
                    color: AppColors.textBlack100,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.spacing4,
                    vertical: 0,
                  ),
                  borderRadius: AppRadius.circular3,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedRoleType = newValue;
                      });
                    }
                  },
                  items: <String>['Creator', 'Admin', 'Editor', 'Viewer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.spacing8), // 40.0

        // Action Buttons
        Row(
          children: [
            // Reset Button (1/2 width)
            Expanded(
              child: BorderButton(
                text: 'Reset',
                onPressed: () {
                  _nameController.clear();
                  setState(() {
                    _selectedRoleType = 'Creator';
                  });
                },
              ),
            ),

            SizedBox(width: AppSpacing.spacing2), // 8.0

            // Save Button (1/2 width)
            Expanded(
              child: MainButton(
                text: 'Save',
                onPressed: _isFormValid
                    ? () {
                        widget.onRoleAdded(
                          _nameController.text.trim(),
                          _selectedRoleType,
                        );
                      }
                    : () {},
                isLoading: widget.isLoading,
                // isDisabled: !_isFormValid,
                isDisabled: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
