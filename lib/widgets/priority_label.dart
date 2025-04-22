import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/style/colors.dart';
import '../core/style/typography.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';

class PriorityLabel extends StatelessWidget {
  final int priority;

  const PriorityLabel({
    Key? key,
    required this.priority,
  })  : assert(priority >= 1 && priority <= 10,
            'Priority must be between 1 and 10'),
        super(key: key);

  Color get _flagColor {
    if (priority <= 3) {
      return const Color(0xFFF03232); // High priority - Red
    } else if (priority <= 7) {
      return const Color(0xFFFF961E); // Medium priority - Orange
    } else {
      return const Color(0xFF03A4AA); // Low priority - Cyan
    }
  }

  Color get _backgroundColor {
    final color = _flagColor;
    return color.withOpacity(0.1); // 10% opacity of the flag color
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing1, // 4.0
        vertical: AppSpacing.spacing1, // 4.0
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(4), // Fixed radius from design
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/levelflag.svg',
            width: 12,
            height: 12,
            colorFilter: ColorFilter.mode(_flagColor, BlendMode.srcIn),
          ),
          SizedBox(width: AppSpacing.spacing1), // 4.0
          Text(
            'P$priority',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: 8.0, // From design spec
              fontWeight: FontWeight.w500,
              letterSpacing: 0.16, // From design spec
              height: 1.5, // From design spec (12px/8px)
              color: _flagColor,
            ),
          ),
        ],
      ),
    );
  }
}

// Helper class to show all priority levels in a row
class PriorityLabelGroup extends StatelessWidget {
  const PriorityLabelGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.spacing2, // 8.0
      runSpacing: AppSpacing.spacing2, // 8.0
      children: List.generate(
        10,
        (index) => PriorityLabel(priority: index + 1),
      ),
    );
  }
}
