import 'dart:ui';

import 'package:flutter/material.dart';

class ConstData {
  static Color primaryClr = Color(0xFFFB352F);
  static Color secondaryClr = Color(0xFF0D1917);
  static Color shimmerClrBase(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade900 : Colors.grey.shade300;
  }

  static Color shimmerClrHighLight(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade800 : Colors.white;
  }
}
