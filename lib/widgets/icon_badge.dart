import 'package:flutter/material.dart';
import '../core/style/colors.dart';
import '../core/style/spacing.dart';
import '../core/style/radius.dart';

class IconBadge extends StatelessWidget {
  final Widget icon;
  final Color color;
  final double size;

  const IconBadge({
    super.key,
    required this.icon,
    required this.color,
    this.size = 20.0,
  });

  Color get backgroundColor => color.withOpacity(0.1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing1, // 4.0
        vertical: AppSpacing.spacing1, // 4.0
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0), // From design spec
      ),
      child: Center(
        child: SizedBox(
          width: 12,
          height: 12,
          child: IconTheme(
            data: IconThemeData(
              color: color,
              size: 12,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}

// Example usage:
// IconBadge(
//   icon: Icon(Icons.info_outline),
//   color: Colors.blue,
// )
// 
// IconBadge(
//   icon: Icon(Icons.star_outline),
//   color: Colors.orange,
// )
// 
// IconBadge(
//   icon: Icon(Icons.bug_report_outlined),
//   color: Colors.red,
// ) 