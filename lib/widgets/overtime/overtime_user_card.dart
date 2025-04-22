import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/style/colors.dart';
import '../../core/style/radius.dart';
import '../../core/style/shadows.dart';
import '../../core/style/spacing.dart';
import '../../core/style/typography.dart';
import '../../core/utils/asset_image.dart' as app_assets;

/// A card widget that displays overtime user information.
/// Based on Figma design from assets/figma/overtime_user_card.json
class OvertimeUserCard extends StatefulWidget {
  /// Staff name
  final String staffName;

  /// Approved by name
  final String approvedByName;

  /// Overtime date
  final String otDate;

  /// Project name
  final String projectName;

  /// Ticket number
  final String ticketNo;

  /// Hours logged
  final String hoursLogged;

  /// Description
  final String description;

  /// Initial approval status
  final bool isApproved;

  /// Callback when approval status changes
  final Function(bool)? onApprovalChanged;

  const OvertimeUserCard({
    Key? key,
    required this.staffName,
    required this.approvedByName,
    required this.otDate,
    required this.projectName,
    required this.ticketNo,
    required this.hoursLogged,
    required this.description,
    this.isApproved = true,
    this.onApprovalChanged,
  }) : super(key: key);

  @override
  State<OvertimeUserCard> createState() => _OvertimeUserCardState();
}

class _OvertimeUserCardState extends State<OvertimeUserCard> {
  bool _isApproved = true;
  bool _isDescriptionExpanded = false;

  @override
  void initState() {
    super.initState();
    _isApproved = widget.isApproved;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.circular3,
        boxShadow: const [AppShadows.smallShadow],
      ),
      child: Column(
        children: [
          _buildStaffInfo(),
          _buildApproverInfo(),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
          _buildOvertimeDetails(),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildStaffInfo() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      child: Row(
        children: [
          SvgPicture.asset(
            app_assets.AssetImage.iconUserCircle,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              AppColors.textFigma40,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: AppSpacing.spacing2),
          Text(
            'Staff: ',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodyMSize,
              fontWeight: AppTypography.regular,
              color: AppColors.textFigma40,
            ),
          ),
          Expanded(
            child: Text(
              widget.staffName,
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.bodyMSize,
                fontWeight: AppTypography.semiBold,
                color: AppColors.textFigma100,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApproverInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spacing4,
        0,
        AppSpacing.spacing4,
        AppSpacing.spacing4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  app_assets.AssetImage.iconUserCircle,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.textFigma40,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.spacing2),
                Text(
                  'Approved by: ',
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: AppTypography.bodyMSize,
                    fontWeight: AppTypography.regular,
                    color: AppColors.textFigma40,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.approvedByName,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: AppTypography.bodyMSize,
                      fontWeight: AppTypography.semiBold,
                      color: AppColors.textFigma100,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.spacing2),
          _buildApprovalDropdown(),
        ],
      ),
    );
  }

  Widget _buildApprovalDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: _isApproved
            ? AppColors.backgroundSemanticGreen20
            : AppColors.backgroundSemanticRed20,
        borderRadius: AppRadius.circular5,
      ),
      child: PopupMenuButton<bool>(
        offset: const Offset(0, 30),
        padding: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circular5,
        ),
        onSelected: (bool value) {
          setState(() {
            _isApproved = value;
          });
          if (widget.onApprovalChanged != null) {
            widget.onApprovalChanged!(value);
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<bool>>[
          PopupMenuItem<bool>(
            value: true,
            child: Text(
              'Approved',
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.bodyMSize,
                fontWeight: AppTypography.medium,
                color: AppColors.backgroundSemanticGreen100,
              ),
            ),
          ),
          PopupMenuItem<bool>(
            value: false,
            child: Text(
              'Rejected',
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.bodyMSize,
                fontWeight: AppTypography.medium,
                color: AppColors.backgroundSemanticRed100,
              ),
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing2,
            vertical: AppSpacing.spacing1,
          ),
          child: Row(
            children: [
              Text(
                _isApproved ? 'Approved' : 'Rejected',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: AppTypography.bodySSize,
                  fontWeight: AppTypography.medium,
                  color: _isApproved
                      ? AppColors.backgroundSemanticGreen100
                      : AppColors.backgroundSemanticRed100,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOvertimeDetails() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OT Date',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodySSize,
                        fontWeight: AppTypography.regular,
                        color: AppColors.textFigma40,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spacing1),
                    Text(
                      widget.otDate,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.textFigma100,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodySSize,
                        fontWeight: AppTypography.regular,
                        color: AppColors.textFigma40,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spacing1),
                    Text(
                      widget.projectName,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.textFigma100,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.spacing4),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ticket No',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodySSize,
                        fontWeight: AppTypography.regular,
                        color: AppColors.textFigma40,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spacing1),
                    Text(
                      widget.ticketNo,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.textFigma100,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hour Logged',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodySSize,
                        fontWeight: AppTypography.regular,
                        color: AppColors.textFigma40,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spacing1),
                    Text(
                      '${widget.hoursLogged} h',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.textFigma100,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reason',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.bodySSize,
              fontWeight: AppTypography.regular,
              color: AppColors.textFigma40,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing1),
          GestureDetector(
            onTap: () {
              setState(() {
                _isDescriptionExpanded = !_isDescriptionExpanded;
              });
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: _isDescriptionExpanded
                        ? widget.description
                        : widget.description.length > 50
                            ? '${widget.description.substring(0, 50)}...'
                            : widget.description,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: AppTypography.bodyMSize,
                      fontWeight: AppTypography.regular,
                      color: AppColors.textFigma100,
                    ),
                  ),
                  if (widget.description.length > 50)
                    TextSpan(
                      text: _isDescriptionExpanded ? ' See Less' : ' See More',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: AppTypography.bodyMSize,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.textFigma40,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
