import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

SnackbarController customSnackBar({required String msg}) {
  return Get.showSnackbar(
    GetSnackBar(
      margin: EdgeInsets.all(8),
      message: msg,
      duration: Duration(seconds: 3),
    ),
  );
}
