import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/style/colors.dart';
import '../../core/style/radius.dart';
import '../../core/style/shadows.dart';
import '../../core/style/spacing.dart';
import '../../core/style/typography.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/app_style.dart';
import '../../core/utils/asset_image.dart' as app_assets;
import '../icon_button.dart';

/// A card widget for displaying project information
///
/// This card shows project details with a customizable header and body,
/// including actions like edit, delete, copy, etc.
class ProjectCard extends StatelessWidget {
  /// Project title (e.g. "ProjectWheel-v1")
  final String title;

  /// Project code identifier
  final String projectCode;

  /// Project key identifier
  final String projectKey;

  /// Content type of the project
  final String contentType;

  /// Width of the card, defaults to match parent
  final double? width;

  /// Height of the card, defaults to auto
  final double? height;

  /// Background color of the card, defaults to white
  final Color cardColor;

  /// Callback when edit button is pressed
  final VoidCallback? onEdit;

  /// Callback when delete button is pressed
  final VoidCallback? onDelete;

  /// Callback when copy button is pressed
  final VoidCallback? onCopy;

  /// Callback when list button is pressed
  final VoidCallback? onList;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.projectCode,
    required this.projectKey,
    required this.contentType,
    this.width,
    this.height,
    this.cardColor = AppColors.backgroundWhite100,
    this.onEdit,
    this.onDelete,
    this.onCopy,
    this.onList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: AppRadius.circular3,
        boxShadow: const [AppShadows.smallShadow],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.projectCardDivider,
          ),
          _buildBody(),
        ],
      ),
    );
  }

  /// Builds the header section with title and action buttons
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      child: Row(
        children: [
          // Project wheel icon and title
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary.withOpacity(0.2)
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    app_assets.AssetImage.iconProjectWheel,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: AppSpacing.spacing2),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          // Action buttons
          Row(
            children: [
              if (onCopy != null)
                AppIconButton(
                  size: 22,
                  iconSize: 14,
                  iconWidget: SvgPicture.asset(
                    app_assets.AssetImage.iconGame,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.iconBlack100,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onCopy!,
                  hasBorder: false,
                  backgroundColor: AppColors.primary,
                  iconColor: AppColors.backgroundWhite20,
                  borderRadius: 5,
                ),
              const SizedBox(width: AppSpacing.spacing2),
              if (onCopy != null)
                AppIconButton(
                  size: 22,
                  iconSize: 14,
                  iconWidget: SvgPicture.asset(
                    app_assets.AssetImage.iconCopy,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.iconBlack100,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onCopy!,
                  hasBorder: false,
                  backgroundColor: AppColors.primary,
                  iconColor: AppColors.backgroundWhite20,
                  borderRadius: 5,
                ),
              const SizedBox(width: AppSpacing.spacing2),
              if (onList != null)
                AppIconButton(
                  size: 22,
                  iconSize: 14,
                  iconWidget: SvgPicture.asset(
                    app_assets.AssetImage.iconList,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.iconBlack100,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onList!,
                  hasBorder: false,
                  backgroundColor: AppColors.primary,
                  iconColor: AppColors.backgroundWhite20,
                  borderRadius: 5,
                ),
              const SizedBox(width: AppSpacing.spacing2),
              if (onList != null)
                AppIconButton(
                  size: 22,
                  iconSize: 14,
                  iconWidget: SvgPicture.asset(
                 "assets/icons/profile.svg",
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.iconBlack100,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onList!,
                  hasBorder: false,
                  backgroundColor: AppColors.primary,
                  iconColor: AppColors.backgroundWhite20,
                  borderRadius: 5,
                ),
              const SizedBox(width: AppSpacing.spacing2),
              if (onEdit != null)
                AppIconButton(
                  size: 22,
                  iconSize: 14,
                  iconWidget: SvgPicture.asset(
                    app_assets.AssetImage.iconEdit,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.iconBlack100,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onEdit!,
                  hasBorder: false,
                  backgroundColor: AppColors.backgroundWhite20,
                ),
              const SizedBox(width: AppSpacing.spacing2),
              if (onDelete != null)
                AppIconButton(
                  size: 22,
                  iconSize: 14,
                  iconWidget: SvgPicture.asset(
                    app_assets.AssetImage.iconDelete,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.iconBlack100,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onDelete!,
                  hasBorder: false,
                  backgroundColor: AppColors.backgroundWhite20,
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the body section with project details
  Widget _buildBody() {
    return Row(
      children: [
        // Project Code
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Project Code',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: AppTypography.bodySSize,
                  color: AppColors.projectCardLabel,
                ),
              ),
              const SizedBox(height: AppSpacing.spacing1),
              Text(
                projectCode,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ],
          ),
        ),
        // Vertical divider
        const SizedBox(
          height: 60,
          child: VerticalDivider(
            width: 32,
            thickness: 1,
            color: AppColors.projectCardDivider,
          ),
        ),
        // Project Key
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Project Key',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: AppTypography.bodySSize,
                  color: AppColors.projectCardLabel,
                ),
              ),
              const SizedBox(height: AppSpacing.spacing1),
              Text(
                projectKey,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ],
          ),
        ),
        // Vertical divider
        const SizedBox(
          height: 60,
          child: VerticalDivider(
            width: 32,
            thickness: 1,
            color: AppColors.projectCardDivider,
          ),
        ),
        // Content Type
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Content Type',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: AppTypography.bodySSize,
                  color: AppColors.projectCardLabel,
                ),
              ),
              const SizedBox(height: AppSpacing.spacing1),
              Text(
                contentType,
                style: TextStyle(
                  fontSize: 14
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
