import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/typography.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';
import '../core/style/shadows.dart';
import 'package:intl/intl.dart';

class SetDeadlineDialog extends StatefulWidget {
  final Function(DateTime) onConfirm;
  final VoidCallback onCancel;

  const SetDeadlineDialog({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<SetDeadlineDialog> createState() => _SetDeadlineDialogState();
}

class _SetDeadlineDialogState extends State<SetDeadlineDialog> {
  DateTime selectedDate = DateTime.now();
  final dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular3,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 416,
        padding: EdgeInsets.all(AppSpacing.spacing6),
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite100,
          borderRadius: AppRadius.circular3,
          boxShadow: [AppShadows.mediumShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Are you sure you want to accept?',
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.bodyLSize,
                fontWeight: AppTypography.semiBold,
                color: AppColors.textBlack100,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.spacing6),
            Row(
              children: [
                Text(
                  'Deadline',
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: AppTypography.bodyMSize,
                    fontWeight: AppTypography.medium,
                    color: AppColors.textBlack100,
                  ),
                ),
                SizedBox(width: AppSpacing.spacing1),
                Text(
                  '*',
                  style: TextStyle(
                    color: AppColors.backgroundSemanticRed100,
                    fontSize: AppTypography.bodyMSize,
                    fontWeight: AppTypography.regular,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.spacing2),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing3),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderBlack10),
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.backgroundWhite100,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        dateFormat.format(selectedDate),
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontSize: AppTypography.bodyMSize,
                          fontWeight: AppTypography.regular,
                          color: AppColors.textBlack100,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: AppColors.iconBlack100,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSpacing.spacing6),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: widget.onCancel,
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: AppSpacing.spacing2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: AppColors.borderBlack10,
                        ),
                      ),
                      backgroundColor: AppColors.backgroundWhite100,
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.textBlack100,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.spacing3),
                Expanded(
                  child: TextButton(
                    onPressed: () => widget.onConfirm(selectedDate),
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: AppSpacing.spacing2),
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.semiBold,
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
