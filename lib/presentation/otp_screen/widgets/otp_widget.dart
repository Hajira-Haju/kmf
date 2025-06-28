import 'package:associations_app/presentation/otp_screen/controller/otp_controller.dart';
import 'package:associations_app/widgets/custom_widget/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constants/const_datas.dart';
import '../../../routes/app_routes/app_routes.dart';

class OtpWidget {
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

  static Widget adminButton(OtpController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          foregroundColor: Colors.white,
          fixedSize: Size(200.w, 40.h),
          backgroundColor: Colors.blueGrey,
        ),
        onPressed: () {
          final savedTime = controller.storage.read('last_support_time');
          if (savedTime != null) {
            final lastClicked = DateTime.parse(savedTime);
            final difference = DateTime.now().difference(lastClicked);
            if (difference < controller.restrictionDuration) {
              final remaining = controller.restrictionDuration - difference;
              Get.snackbar(
                'Already applied.',
                'We will contact you or Try again in ${remaining.inMinutes} minutes',
                snackPosition: SnackPosition.BOTTOM,
              );
              return;
            }
          }
          controller.contactAdminInfo();
        },
        icon: Icon(CupertinoIcons.right_chevron),
        label: Text('Contact admin'),
      ),
    );
  }

  static Widget otpField(OtpController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Pinput(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the OTP';
          } else if (value.length != 4) {
            return 'Invalid OTP';
          } else {
            return value == controller.civilLast4 ? null : 'Invalid OTP';
          }
        },
        onChanged: (value) {
          if (value == controller.civilLast4) {
            Get.offAllNamed(AppRoutes.welcomeScreen);
          }
        },
        focusedPinTheme: PinTheme(
          width: 60,
          height: 70,
          textStyle: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ConstData.secondaryClr,
              width: 2,
            ), // Focused border
          ),
        ),
        defaultPinTheme: PinTheme(
          width: 60,
          height: 70,
          textStyle: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
        ),
        keyboardType: TextInputType.number,
        showCursor: true,
        onCompleted: (pin) => debugPrint(pin),
      ),
    );
  }

  static Widget resendOtp(OtpController controller) {
    bool isDark = Theme.of(Get.context!).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        text: TextSpan(
          text: 'Sent to you at ****${controller.phLast4}.',
          style: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.white : Colors.black87,
          ),
          children: [
            WidgetSpan(
              child: Obx(
                () => GestureDetector(
                  onTap:
                      controller.resendOtp.value
                          ? () {
                            customSnackBar(msg: 'OTP sent successfully');
                            controller.resendOtp.value = false;
                          }
                          : null,
                  child: Text(
                    ' RESEND OTP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:
                          controller.resendOtp.value
                              ? ConstData.primaryClr
                              : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            WidgetSpan(
              child: Obx(() {
                if (controller.secondsRemaining.value == 0) {
                  return SizedBox();
                } else {
                  return Text(
                    ' in 00:${controller.secondsRemaining.value.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  static BottomSheet assistanceSheet(RxBool isApproved) {
    OtpController controller = Get.find();
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: double.infinity, height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 6,
                ),
                child: Text(
                  'Need Assistance?',
                  style: TextStyle(
                    color: ConstData.secondaryClr,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  'You are just one step away from completing your Digital ID registration. If you are stuck on this screen or unable to receive the OTP, click the button below to register a complaint. An association representative will contact you shortly.',
                ),
              ),
              Obx(() {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isApproved.value,
                            onChanged: (value) {
                              isApproved.value = value!;
                            },
                          ),
                          Flexible(
                            child: Text(
                              'I confirm that I have not received any OTP on my mobile or email.',
                              style: TextStyle(
                                color: ConstData.secondaryClr,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 14,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(
                              () => customButton(
                                fixedSize: Size(double.infinity, 50),
                                isLoading: controller.isLoading.value,
                                btnTxt: 'Request Assistance',
                                onTap:
                                    isApproved.value
                                        ? () async {
                                          await controller.requestAssistance();
                                          controller.isApproved.value = false;
                                          Get.close(1);
                                        }
                                        : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
