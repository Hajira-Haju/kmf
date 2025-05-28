import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWidgets {
  static Widget head() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset('assets/the-associates_logo.png', width: 80),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              'Keralites Medical Forum Kuwait',
              style: TextStyle(
                fontSize: 18,
                color: ConstData.secondaryClr,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  static Widget customButton({
    required String btnTxt,
    required VoidCallback? onTap,
    Color? clr
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        fixedSize: Size(200.w, 60),
        backgroundColor: clr??ConstData.primaryClr,
        foregroundColor: Colors.white,
      ),
      onPressed: onTap,
      child: Text(
        btnTxt,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
