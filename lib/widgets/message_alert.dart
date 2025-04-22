import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/typography.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';
import '../core/style/shadows.dart';

class MessageAlert extends StatelessWidget {
  final String title;
  final String? description;
  final VoidCallback? onClose;
  final bool isVisible;

  const MessageAlert({
    Key? key,
    required this.title,
    this.description,
    this.onClose,
    this.isVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Container(
      width: description != null ? 416 : 283,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FD),
        borderRadius: BorderRadius.circular(description != null ? 16 : 8),
        border: Border.all(
          color: const Color(0xFFD8DFE8),
        ),
        boxShadow: [
          // Primary shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 3),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          // Secondary shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 6),
            blurRadius: 16,
          ),
          // Tertiary shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 9),
            blurRadius: 28,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            child: Icon(
              Icons.check_circle,
              size: 21,
              color: const Color(0xFF1AC391),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16, // Line height 24px
                    color: const Color(0xFF2B2F3D),
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    description!,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 22 / 14, // Line height 22px
                      color: const Color(0xFF75809D),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: 8),
            InkWell(
              onTap: onClose,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.close,
                  size: 12,
                  color: Color(0xFF2B2F3D),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
