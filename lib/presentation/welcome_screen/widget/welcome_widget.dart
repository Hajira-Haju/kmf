import 'package:associations_app/presentation/id_screen/id_screen.dart';
import 'package:associations_app/presentation/welcome_screen/controller/welcome_controller.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/constants/const_datas.dart';

class WelcomeWidget {
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

  static Widget profileUpload(WelcomeController controller) {
    return Obx(
      () => Stack(
        children: [
          GestureDetector(
            onTap: controller.isLoading.value ? null : controller.pickImage,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage:
                    controller.selectedImage.value != null
                        ? FileImage(controller.selectedImage.value!)
                        : null,
                child:
                    controller.selectedImage.value == null
                        ? Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Colors.grey[600],
                        )
                        : null,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child:
                controller.selectedImage.value == null
                    ? SizedBox()
                    : CircleAvatar(
                      backgroundColor: ConstData.secondaryClr,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.edit),
                    ),
          ),
        ],
      ),
    );
  }
}
