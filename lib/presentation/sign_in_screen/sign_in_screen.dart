import 'package:associations_app/presentation/sign_in_screen/controller/sign_in_controller.dart';
import 'package:associations_app/presentation/sign_in_screen/widgets/custom_field.dart';
import 'package:associations_app/presentation/sign_in_screen/widgets/sign_in_widget.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/constants/const_datas.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
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
                    'assets/login_bg.svg',
                    width: double.infinity,
                    height: 450.h,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Positioned(
                top: 370.h,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                      SizedBox(height: 20),
                      CustomField(
                        hint: 'Enter your Civil-Id',
                        prefix: CupertinoIcons.number,
                      ),
                      SizedBox(height: 40),
                      Text(
                        'We will send you-one time\npassword(OTP)',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Carrier rates may apply',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ConstData.primaryClr,
                        ),
                      ),
                      SizedBox(height: 20),
                      LoginWidgets.customButton(
                        btnTxt: 'Log in',
                        onTap: () {
                          Get.toNamed(AppRoutes.otpScreen);
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
