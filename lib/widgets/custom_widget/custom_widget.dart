import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants/const_datas.dart';

SnackbarController customSnackBar({required String msg, Color? clr}) {
  return Get.showSnackbar(
    GetSnackBar(
      margin: EdgeInsets.all(8),
      message: msg,
      duration: Duration(seconds: 3),
      backgroundColor: clr ?? Colors.grey.shade800,
    ),
  );
}

ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
customBanner({
  required String msg,
  required Color clr,
  void Function()? onTap,
}) {
  return ScaffoldMessenger.of(Get.context!).showMaterialBanner(
    MaterialBanner(
      content: Text(msg),
      leading: Icon(Icons.info, color: Colors.white),
      backgroundColor: clr,
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text('DISMISS', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}

Widget customButton({
  required String btnTxt,
  required VoidCallback? onTap,
  Color? clr,
  bool isLoading = false,
  Size? fixedSize,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      fixedSize: fixedSize ?? Size(200.w, 60),
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
