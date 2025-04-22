import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/style/colors.dart';
import '../core/style/radius.dart';
import '../core/style/spacing.dart';
import '../core/style/typography.dart';

class RatingBadge extends StatelessWidget {
  final double rating;

  const RatingBadge({
    super.key,
    required this.rating,
  }) : assert(rating >= 1 && rating <= 5);

  Color get ratingColor {
    if (rating == 1) return const Color(0xFFF03232); // Red from design
    if (rating == 5) return const Color(0xFFFF961E); // Orange from design
    return AppColors.disabledGrey;
  }

  Color get backgroundColor {
    return ratingColor.withOpacity(0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing1, // 4.0
        vertical: AppSpacing.spacing1, // 4.0
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0), // From design spec
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rating.toString(),
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: 8.0,
              fontWeight: AppTypography.medium,
              letterSpacing: 0.16,
              height: 1.5,
              color: ratingColor,
            ),
          ),
          SizedBox(width: AppSpacing.spacing1), // 4.0
          SvgPicture.asset(
            'assets/icons/star.svg',
            width: 10,
            height: 10,
            colorFilter: ColorFilter.mode(ratingColor, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}

class RatingBadgeGroup extends StatelessWidget {
  final List<double> ratings;

  const RatingBadgeGroup({
    super.key,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.spacing2, // 8.0
      runSpacing: AppSpacing.spacing2, // 8.0
      children: ratings.map((rating) => RatingBadge(rating: rating)).toList(),
    );
  }
}
