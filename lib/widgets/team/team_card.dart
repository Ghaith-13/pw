import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/style/colors.dart';
import '../../core/style/radius.dart';
import '../../core/style/shadows.dart';
import '../../core/style/spacing.dart';
import '../../core/style/typography.dart';
import '../../core/utils/asset_image.dart' as app_assets;

/// A widget that displays a team member card with name and action buttons
/// Based on the Figma design for table-cell component
class TeamCard extends StatelessWidget {
  /// The name of the team member
  final String name;

  /// The role of the team member (not displayed, kept for API compatibility)
  final String role;

  /// Callback when the edit button is pressed
  final VoidCallback? onEdit;

  /// Callback when the delete button is pressed
  final VoidCallback? onDelete;

  /// Callback when the user details button is pressed
  final VoidCallback? onUserDetails;

  const TeamCard({
    Key? key,
    required this.name,
    required this.role,
    this.onEdit,
    this.onDelete,
    this.onUserDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing4,
        vertical: AppSpacing.spacing3,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite100,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [AppShadows.smallShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Name section
          Text(
            name,
            style: AppTypography.bodyLMedium.copyWith(
              fontWeight: AppTypography.semiBold,
            ),
          ),

          // Action buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Edit button
              if (onEdit != null)
                _buildIconButton(
                  app_assets.AssetImage.iconEdit,
                  onEdit!,
                ),

              // Delete button
              if (onDelete != null)
                _buildIconButton(
                  app_assets.AssetImage.iconDelete,
                  onDelete!,
                ),

              // User details button (now rightmost)
              if (onUserDetails != null)
                _buildIconButton(
                  app_assets.AssetImage.iconUsers,
                  onUserDetails!,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(String iconPath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing2),
        child: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(
              AppColors.iconBlack40,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
