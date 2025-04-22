import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/typography.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';
import '../core/style/shadows.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkay;
  final bool isVisible;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onOkay,
    this.isVisible = true,
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
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FD),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.warning_rounded,
                    size: 15.75,
                    color: const Color(0xFFF03232),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.33,
                    color: Color(0xFF2B2F3D),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1.57,
                color: Color(0xFF2B2F3D),
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: onOkay,
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                backgroundColor: const Color(0xFF03A4AA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Okay',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.57,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
