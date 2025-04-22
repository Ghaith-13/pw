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

class StaffMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final VoidCallback? onDelete;

  const StaffMemberCard({
    Key? key,
    required this.name,
    required this.role,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.spacing2),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite100,
        borderRadius: AppRadius.circular3,
        boxShadow: const [
          BoxShadow(
            color: Color(0x07A9AEB6),
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildUserInfo(),
          ),
          if (onDelete != null) _buildDeleteButton(),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.bodyLSize,
            fontWeight: AppTypography.bold,
            color: AppColors.textFigma100,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing1 / 2),
        Text(
          role,
          style: TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.bodyMSize,
            fontWeight: AppTypography.regular,
            color: AppColors.textFigma40,
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: onDelete,
      child: SvgPicture.asset(
        app_assets.AssetImage.iconDelete,
        width: 16,
        height: 16,
        colorFilter: ColorFilter.mode(
          AppColors.iconFigma40,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
