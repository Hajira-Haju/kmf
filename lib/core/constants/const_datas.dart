import 'dart:ui';

import 'package:flutter/material.dart';

class ConstData {
  static Color primaryClr = Color(0xFFE92229);
  static Color secondaryClr = Color(0xFF224390);
  static Color shimmerClrBase(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade900 : Colors.grey.shade300;
  }

  static Color shimmerClrHighLight(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade800 : Colors.white;
  }
}
