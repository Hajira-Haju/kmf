import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginWidgets {
  static Widget head(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: ColorFiltered(
          colorFilter: isDark
              ? ColorFilter.mode(Colors.grey, BlendMode.srcIn)
              : ColorFilter.mode(Colors.transparent, BlendMode.multiply),
          child: Image.asset('assets/mainlogo2.png', width: 180),
        ),
      ),
    );
  }
}
