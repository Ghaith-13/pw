import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/typography.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';
import '../core/style/shadows.dart';

enum AlertType { info, error, warning, success }

class InformationAlert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClose;
  final bool isVisible;
  final AlertType type;

  const InformationAlert({
    Key? key,
    required this.title,
    required this.message,
    required this.onClose,
    required this.type,
    this.isVisible = true,
  }) : super(key: key);

  Color get _backgroundColor {
    switch (type) {
      case AlertType.error:
        return const Color(0xFFF03232);
      case AlertType.info:
        return const Color(0xFF3763EF);
      case AlertType.warning:
        return const Color(0xFFF69611);
      case AlertType.success:
        return const Color(0xFF00A76F);
    }
  }

  IconData get _icon {
    switch (type) {
      case AlertType.error:
        return Icons.close;
      case AlertType.info:
        return Icons.info_outline;
      case AlertType.warning:
        return Icons.warning_amber_rounded;
      case AlertType.success:
        return Icons.check_circle_outline;
    }
  }

  Color get _shadowColor {
    switch (type) {
      case AlertType.error:
        return const Color(0xFFFFCDCD);
      case AlertType.info:
        return const Color(0xFF7ABAFF);
      case AlertType.warning:
        return const Color(0xFFFFE1B3);
      case AlertType.success:
        return const Color(0xFFB3FFE1);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    final baseColor = _backgroundColor;
    final iconData = _icon;
    final shadowColor = _shadowColor;

    return Container(
      width: 328,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: baseColor,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    iconData,
                    size: type == AlertType.error ? 23 : 21.5,
                    color: baseColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: baseColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        message,
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: const Color(0xFF2B2F3D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onClose,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: const Icon(
                Icons.close,
                size: 20,
                color: Color(0xFF2B2F3D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
