import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes/app_routes.dart';

class SignInController extends GetxController {
  RxBool isObscure = true.obs;
  final formKey = GlobalKey<FormState>();
  RxBool showError = false.obs;
  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  Future<void> submitCivilId() async {
    showError.value = true;
    await Future.delayed(Duration(milliseconds: 100));
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.otpScreen);
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
