import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/data/api_client/api_service/api_service.dart';
import '../../../routes/app_routes/app_routes.dart';

class SignInController extends GetxController {
  RxBool isObscure = true.obs;
  final formKey = GlobalKey<FormState>();
  RxBool showError = false.obs;
  final apiService = ApiService();
  final civilIdController = TextEditingController();
  String deviceId = 'N/A';
  String deviceModel = 'N/A';
  String deviceName = 'N/A';
  String deviceOs = 'N/A';
  RxBool isLoading = false.obs;

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  Future<void> submitCivilId() async {
    showError.value = true;
    await getDeviceInfo();
    await Future.delayed(Duration(milliseconds: 100));
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await apiService.login(
        civilId: civilIdController.text,
        deviceId: deviceId,
        deviceName: deviceName,
        deviceModel: deviceModel,
        deviceType: deviceOs,
      );
    }
    isLoading.value = false;
  }

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      deviceId = androidInfo.id;
      deviceModel = androidInfo.model;
      deviceName = androidInfo.device;
      deviceOs = 'android';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? 'Unknown';
      deviceModel = iosInfo.utsname.machine;
      deviceName = iosInfo.name;
      deviceOs = 'ios';
    }
  }

  bool isValidKuwaitCivilID(String civilId) {
    if (civilId.length != 12 || !RegExp(r'^\d{12}$').hasMatch(civilId)) {
      return false;
    }

    // Extract and validate DOB
    int centuryDigit = int.parse(civilId[0]);
    int year = int.parse(civilId.substring(1, 3));
    int month = int.parse(civilId.substring(3, 5));
    int day = int.parse(civilId.substring(5, 7));

    if (centuryDigit == 3) {
      year += 2000;
    } else if (centuryDigit == 2) {
      year += 1900;
    } else {
      return false; // Invalid century digit
    }

    try {
      DateTime dob = DateTime(year, month, day);
      if (dob.year != year || dob.month != month || dob.day != day) {
        return false;
      }
    } catch (_) {
      return false; // Invalid date
    }

    // Checksum validation
    List<int> weights = [2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
    int sum = 0;

    for (int i = 0; i < 11; i++) {
      sum += int.parse(civilId[i]) * weights[i];
    }

    int remainder = sum % 11;
    int checksum = 11 - remainder;

    if (checksum == 11) {
      checksum = 0;
    } else if (checksum == 10) {
      return false;
    }

    return checksum == int.parse(civilId[11]);
  }
}
