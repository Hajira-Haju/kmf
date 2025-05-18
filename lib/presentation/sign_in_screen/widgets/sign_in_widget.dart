import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWidgets {
  static Widget customButton({required String btnTxt,required VoidCallback? onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        fixedSize: Size(200.w, 35.h),
        backgroundColor: ConstData.primaryClr,
        foregroundColor: Colors.white,
      ),
      onPressed: onTap,
      child: Text(btnTxt),
    );
  }
}
