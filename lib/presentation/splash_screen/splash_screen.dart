import 'package:associations_app/presentation/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: ColorFiltered(
            colorFilter: isDark
                ? ColorFilter.mode(Colors.grey, BlendMode.srcIn)
                : ColorFilter.mode(Colors.transparent, BlendMode.multiply),
            child: Image.asset('assets/mainlogo2.png', width: 200.w),
          ),
        ),
      ),
    );
  }
}
