import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/storage_service/storage_service.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  Timer? timer;
  RxInt secondsRemaining = 59.obs;
  RxBool resendOtp = false.obs;
  final storage = StorageService();
  String? get civilId => storage.read('civilId');
  String get phone => (storage.read('phone') ?? 'INVALID').toString();
  bool get otpReq => storage.read('otpReq') ?? false;
  String get phLast4 => phone.substring(phone.length - 4);
  String get civilLast4 => civilId!.substring(civilId!.length - 4);
  void startTimer() {
    secondsRemaining.value = 59; // Reset the counter
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        resendOtp.value = true;
        timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    // TODO: implement onClose
    super.onClose();
  }
}
