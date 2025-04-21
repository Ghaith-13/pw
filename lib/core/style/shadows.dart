import 'package:flutter/material.dart';
import 'colors.dart';

class AppShadows {
  static const BoxShadow smallShadow = BoxShadow(
    color: Color(0x1A000000), // Black 10%
    blurRadius: 4,
    offset: Offset(0, 2),
  );

  static const BoxShadow mediumShadow = BoxShadow(
    color: Color(0x29000000), // Black 16%
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow largeShadow = BoxShadow(
    color: Color(0x33000000), // Black 20%
    blurRadius: 16,
    offset: Offset(0, 8),
  );
}
