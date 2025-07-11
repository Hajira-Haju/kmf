import 'dart:io';
import 'package:associations_app/presentation/welcome_screen/controller/welcome_controller.dart';
import 'package:associations_app/presentation/welcome_screen/widget/welcome_widget.dart';
import 'package:associations_app/widgets/custom_widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:associations_app/core/constants/const_datas.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/dot_indicator/dot_indicator.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 40),

                /// Header
                WelcomeWidget.head(context),
                const SizedBox(height: 50),

                /// Welcome Text
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: ConstData.secondaryClr,
                  ),
                ),
                Text(
                  controller.userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: ConstData.secondaryClr,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Upload your profile photo to complete your welcome process.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),

                /// Profile Upload
                WelcomeWidget.profileUpload(controller),
                SizedBox(height: 10),
                Obx(() {
                  if (!controller.hasPerson.value &&
                      controller.showBanner.value) {
                    return WelcomeWidget.infoBanner();
                  } else {
                    return SizedBox();
                  }
                }),
                // const SizedBox(height: 60),
              ],
            ),

            /// Continue Button
            Positioned(
              bottom: 30,
              left: 10,
              right: 10,
              child: Obx(
                () => customButton(
                  btnTxt: 'Continue',
                  onTap:
                      controller.selectedImage.value != null &&
                              controller.hasPerson.value
                          ? () async {
                            controller.isLoading.value
                                ? null
                                : controller.submitPhoto();
                          }
                          : null,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                  tag: 'indicator',
                  child: DotIndicator(pageIndex: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
