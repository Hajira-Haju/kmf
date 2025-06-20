import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants/const_datas.dart';

SnackbarController customSnackBar({required String msg}) {
  return Get.showSnackbar(
    GetSnackBar(
      margin: EdgeInsets.all(8),
      message: msg,
      duration: Duration(seconds: 3),
    ),
  );
}

Widget customButton({
  required String btnTxt,
  required VoidCallback? onTap,
  Color? clr,
  bool isLoading = false,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      fixedSize: Size(200.w, 60),
      backgroundColor: clr ?? ConstData.primaryClr,
      foregroundColor: Colors.white,
    ),
    onPressed: onTap,
    child:
        isLoading
            ? SpinKitRipple(color: Colors.white)
            : Text(
              btnTxt,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
  );
}
