import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/style/colors.dart';
import '../../core/style/radius.dart';
import '../../core/style/spacing.dart';
import '../../core/style/typography.dart';
import '../../core/utils/asset_image.dart' as app_assets;

/// A card widget that displays overtime status information.
/// Based on Figma design from assets/figma/overtime_status.json
class OvertimeStatusCard extends StatelessWidget {
  /// The icon to display. Defaults to hourglass icon.
  final String icon;

  /// The width of the icon.
  final double iconWidth;

  /// The height of the icon.
  final double iconHeight;

  /// The color of the icon. Defaults to teal color.
  final Color iconColor;

  /// The title of the card. Defaults to "Approved Overtime Hours".
  final String title;

  /// The value to display. Defaults to "0".
  final String value;

  const OvertimeStatusCard({
    Key? key,
    this.icon = app_assets.AssetImage.iconHourglass,
    this.iconWidth = 24.0,
    this.iconHeight = 24.0,
    this.iconColor = AppColors.backgroundOvertime,
    this.title = 'Approved Overtime Hours',
    this.value = '0',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      decoration: BoxDecoration(
        color: AppColors.backgroundOvertime.withOpacity(0.4),
        borderRadius: BorderRadius.circular(AppRadius.round3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          SvgPicture.asset(
            icon,
            width: iconWidth,
            height: iconHeight,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),

          SizedBox(height: AppSpacing.spacing6), // 24px spacing from Figma

          // Title and Value
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: AppTypography.bodyLSize,
                  fontWeight: AppTypography.medium,
                  color: AppColors.backgroundOvertime,
                ),
              ),

              SizedBox(height: AppSpacing.spacing2), // 8px spacing

              // Value
              Text(
                value,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: AppTypography.headingLSize,
                  fontWeight: AppTypography.semiBold,
                  color: AppColors.textWhite100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
