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
import '../../widgets/dot_indicator/dot_indicator.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

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

                      /// Welcome Text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter Your Civil Id',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: ConstData.secondaryClr,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Please enter your Civil ID number to continue. This helps us verify your identity.',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                          // textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: 30),
                      Obx(
                        () => CustomField(
                          readOnly: controller.isLoading.value,
                          controller: controller.civilIdController,
                          maxLength: 12,
                          hint: 'Enter Civil id here...',
                          onChanged: (p0) => controller.showError.value = false,
                          validator:
                              controller.showError.value
                                  ? (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Civil ID';
                                    } else if (!controller.isValidKuwaitCivilID(
                                      value,
                                    )) {
                                      return 'Invalid Civil ID';
                                    } else {
                                      return null;
                                    }
                                  }
                                  : null,
                          onFieldSubmitted:
                              (value) => controller.submitCivilId(),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 40,
                    child: Obx(
                      () => LoginWidgets.customButton(
                        isLoading: controller.isLoading.value,
                        btnTxt: 'Continue',
                        onTap: () {
                          controller.submitCivilId();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: 'indicator',
                        child: DotIndicator(pageIndex: 0),
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
