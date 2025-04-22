import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/typography.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';
import '../core/style/shadows.dart';

class CustomModalDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final bool isVisible;
  final String cancelButtonText;
  final String confirmButtonText;

  const CustomModalDialog({
    Key? key,
    this.title = 'Delete Staff',
    this.content = 'Are you sure you want to delete John Doe?',
    required this.onCancel,
    required this.onDelete,
    this.isVisible = true,
    this.cancelButtonText = 'Cancel',
    this.confirmButtonText = 'Delete',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 416,
        padding: EdgeInsets.fromLTRB(
          AppSpacing.spacing32,
          AppSpacing.spacing32,
          AppSpacing.spacing32,
          AppSpacing.spacing6,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFD8E0E8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 9),
              blurRadius: 28,
              spreadRadius: 8,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, 6),
              blurRadius: 16,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.bodyLSize,
                fontWeight: AppTypography.medium,
                color: AppColors.textBlack100,
              ),
            ),
            SizedBox(height: AppSpacing.spacing1 / 2),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.bodyMSize,
                fontWeight: AppTypography.regular,
                color: AppColors.textBlack40,
                height: 1.57,
              ),
            ),
            SizedBox(height: AppSpacing.spacing6),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onCancel,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSpacing.spacing1,
                        horizontal: AppSpacing.spacing3 + AppSpacing.spacing1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      cancelButtonText,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.regular,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.spacing2),
                Expanded(
                  child: TextButton(
                    onPressed: onDelete,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSpacing.spacing1,
                        horizontal: AppSpacing.spacing3 + AppSpacing.spacing1,
                      ),
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      confirmButtonText,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.regular,
                        color: AppColors.textWhite100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
