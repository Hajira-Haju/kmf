import 'package:associations_app/presentation/otp_screen/controller/otp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constants/const_datas.dart';

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

  static Widget adminButton() {
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
        onPressed: () {},
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
            return null;
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        text: TextSpan(
          text: 'Sent to you at ****1234.',
          style: TextStyle(fontSize: 16, color: Colors.black87),
          children: [
            WidgetSpan(
              child: Obx(
                () => Text(
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
            WidgetSpan(
              child: Obx(() {
                if (controller.resendOtp.value) {
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
}
