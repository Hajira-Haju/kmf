import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/otp_screen/controller/otp_controller.dart';
import 'package:associations_app/presentation/otp_screen/widgets/otp_widget.dart';
import 'package:associations_app/presentation/sign_in_screen/widgets/sign_in_widget.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import '../../widgets/custom_widget/custom_widget.dart';
import '../../widgets/dot_indicator/dot_indicator.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: double.infinity, height: 30),
                      LoginWidgets.head(),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter the 4-digit code',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: ConstData.secondaryClr,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      OtpWidget.resendOtp(controller),
                      SizedBox(height: 30),
                      OtpWidget.otpField(controller),
                    ],
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 90,
                    child: customButton(
                      btnTxt: 'Continue',
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          Get.offAllNamed(AppRoutes.welcomeScreen);
                        } else {
                          Get.snackbar(
                            'Invalid otp',
                            'Enter a valid otp',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                    ),
                  ),
                 Positioned(
                    left: 20,
                    right: 20,
                    bottom: 15,
                    child: OtpWidget.adminButton(controller),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: 'indicator',
                        child: DotIndicator(pageIndex: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
