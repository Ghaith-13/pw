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

class StaffCard extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final String mobile;
  final String accessLevel;
  final String status;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const StaffCard({
    Key? key,
    required this.name,
    required this.role,
    required this.email,
    required this.mobile,
    required this.accessLevel,
    required this.status,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.spacing2),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [AppShadows.smallShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.borderBlack10,
              indent: 0,
              endIndent: 0),
          _buildInfoGrid(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.backgroundBlack10,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(app_assets.AssetImage.iconProfile),
            ),
          ),
          const SizedBox(width: AppSpacing.spacing2),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppTypography.bodyLMedium,
                ),
                const SizedBox(width: AppSpacing.spacing2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.spacing2,
                    vertical: AppSpacing.spacing1,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundBlack10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    role,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: AppTypography.bodySSize,
                      fontWeight: AppTypography.regular,
                      color: AppColors.textBlack60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildInfoGrid() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildInfoCell('Email', email, true, false),
              ),
              Expanded(
                child: _buildInfoCell('Mobile', mobile, false, false),
              ),
            ],
          ),
        ),
        const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.borderBlack10,
            indent: 0,
            endIndent: 0),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildInfoCell('Access Level', accessLevel, true, false),
              ),
              Expanded(
                child: _buildStatusCell(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCell(
      String label, String value, bool hasRightBorder, bool hasBottomBorder) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: hasRightBorder
              ? BorderSide(color: AppColors.borderBlack10, width: 1)
              : BorderSide.none,
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodyMSize,
              fontWeight: AppTypography.regular,
              color: AppColors.textBlack60,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1),
          Text(
            value,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodyMSize,
              fontWeight: AppTypography.medium,
              color: AppColors.textBlack100,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCell() {
    final Color statusColor = _getStatusColor();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodyMSize,
              fontWeight: AppTypography.regular,
              color: AppColors.textBlack60,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing2,
              vertical: AppSpacing.spacing1,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   width: 8,
                //   height: 8,
                //   decoration: BoxDecoration(
                //     color: statusColor,
                //     shape: BoxShape.circle,
                //   ),
                // ),
                const SizedBox(width: AppSpacing.spacing1),
                Text(
                  status,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: AppTypography.bodyMSize,
                    fontWeight: AppTypography.medium,
                    color: statusColor,
                  ),
                ),
                const SizedBox(width: AppSpacing.spacing1),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: statusColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (onEdit != null)
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onEdit,
              icon: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  app_assets.AssetImage.iconEdit,
                ),
              ),
              splashRadius: 20,
              tooltip: 'Edit',
            ),
          ),
        if (onDelete != null)
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onDelete,
              icon: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  app_assets.AssetImage.iconDelete,
                ),
              ),
              splashRadius: 20,
              tooltip: 'Delete',
            ),
          ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'active':
        return const Color(0xFF039267); // Exact color from screenshot
      case 'inactive':
        return AppColors.backgroundSemanticRed100;
      case 'pending':
        return AppColors.backgroundSemanticYellow100;
      default:
        return AppColors.backgroundBlack60;
    }
  }
}
