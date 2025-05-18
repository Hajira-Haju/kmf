import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/sign_in_screen/widgets/sign_in_widget.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/otp_bg.svg',
                    width: double.infinity,
                    height: 400.h,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Positioned(
                top: 370.h,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 250.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Enter OTP',
                        style: TextStyle(
                          color: ConstData.primaryClr,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 30),
                      Pinput(
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      ),
                      SizedBox(height: 40),
                      LoginWidgets.customButton(
                        btnTxt: 'Submit',
                        onTap: () {
                          Get.toNamed(AppRoutes.bottomNavScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
