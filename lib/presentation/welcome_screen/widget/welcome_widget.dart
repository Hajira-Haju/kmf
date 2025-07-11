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
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/const_datas.dart';

class WelcomeWidget {
  static Widget head(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ColorFiltered(
        colorFilter: isDark
            ? ColorFilter.mode(Colors.grey, BlendMode.srcIn)
            : ColorFilter.mode(Colors.transparent, BlendMode.multiply),
        child: Image.asset('assets/mainlogo2.png', width: 200),
      ),
    );
  }

  static Widget infoBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.lightbulb_fill),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              'Please make sure your face is clearly visible in the picture and try again.',
            ),
          ),
        ],
      ),
    );
  }

  static Widget profileUpload(WelcomeController controller) {
    bool isDark = Theme.of(Get.context!).brightness == Brightness.dark;
    return Obx(
      () => Stack(
        children: [
          GestureDetector(
            onTap: () {
              controller.isLoading.value
                  ? null
                  : controller.showOptions(controller);
            },
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
                backgroundColor: isDark ? Colors.grey.shade600 : Colors.white,
                backgroundImage:
                    controller.selectedImage.value != null
                        ? FileImage(controller.selectedImage.value!)
                        : null,
                child:
                    controller.selectedImage.value == null
                        ? Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color:
                              isDark ? Colors.grey.shade300 : Colors.grey[600],
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

  static Widget imageSelector(WelcomeController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Choose an option',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                InkWell(
                  onTap: () => controller.pickImage(ImageSource.camera),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ConstData.secondaryClr,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.camera_alt_outlined, size: 30),
                      ),
                      Text('Camera'),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () => controller.pickImage(ImageSource.gallery),

                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ConstData.secondaryClr,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.photo_library_outlined, size: 30),
                      ),
                      Text('Gallery'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
