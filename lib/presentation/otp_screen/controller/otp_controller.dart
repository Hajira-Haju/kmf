import 'dart:async';

import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:associations_app/presentation/otp_screen/widgets/otp_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/Services/storage_service/storage_service.dart';
import '../../../core/constants/const_datas.dart';
import '../../../widgets/custom_widget/custom_widget.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  Timer? timer;
  RxInt secondsRemaining = 59.obs;
  RxBool resendOtp = false.obs;
  RxBool isApproved = false.obs;
  final storage = StorageService();
  String? get civilId => storage.read('civilId');
  String get phone => (storage.read('phone') ?? 'INVALID').toString();
  bool get otpReq => storage.read('otpReq') ?? false;
  String get phLast4 => phone.substring(phone.length - 4);
  String get civilLast4 => civilId!.substring(civilId!.length - 4);
  String get name => storage.read('usrName') ?? 'N/A';
  final restrictionDuration = Duration(hours: 2);
  final api = ApiService();
  RxBool isLoading = false.obs;
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

  Future<void> requestAssistance() async {
    isLoading.value = true;
    await api.contactUs(
      name: name,
      description:
          'Trouble in Login. Please contact as soon as Possible for support...',
      contactNo: phone,
      type: 1,
    );
    isLoading.value = false;
  }

  void contactAdminInfo() {
    Get.bottomSheet(OtpWidget.assistanceSheet(isApproved));
  }
}
