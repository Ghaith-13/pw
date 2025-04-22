import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/typography.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';
import '../core/style/shadows.dart';

class SuccessAlert extends StatelessWidget {
  final String message;
  final VoidCallback onClose;
  final bool isVisible;

  const SuccessAlert({
    Key? key,
    required this.message,
    required this.onClose,
    this.isVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Container(
      width: 328,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing6,
        vertical: AppSpacing.spacing3,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1AC391).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF1AC391),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFBFEADA),
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_outline,
                  size: 24,
                  color: const Color(0xFF1AC391),
                ),
              ),
              SizedBox(width: AppSpacing.spacing4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SUCCESS!',
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: AppTypography.bodyMSize,
                      fontWeight: AppTypography.medium,
                      height: 1.5,
                      color: const Color(0xFF1AC391),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: AppTypography.bodyMSize,
                      fontWeight: AppTypography.regular,
                      height: 1.5,
                      color: AppColors.textBlack100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: onClose,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: Icon(
                Icons.close,
                size: 20,
                color: AppColors.textBlack100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
