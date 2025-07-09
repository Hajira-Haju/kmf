import 'dart:convert';

import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:associations_app/tst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../generated/assets.dart';
import '../../../widgets/social_button/social_button.dart';
import '../controller/bottom_nav_controller.dart';
import '../models/bottom_nav_datas.dart';

class BottomNavWidgets {
  static Widget drawer(BottomNavController controller) {
    final isDark = Get.isDarkMode;
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5.r),
            bottomRight: Radius.circular(5.r),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(width: double.infinity, height: 60),
                  Image.asset('assets/the-associates_logo.png', width: 100),
                  SizedBox(height: 20),
                  Text(
                    'KERALITES MEDICAL\nFORUM',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: BottomNavData.drawerData.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = BottomNavData.drawerData[index];
                      return ListTile(
                        leading: Icon(data.icn, color: ConstData.secondaryClr),
                        title: Text(data.title),
                        trailing: Icon(CupertinoIcons.right_chevron),
                        onTap: data.onTap,
                      );
                    },
                  ),
                  Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialButton(
                            isExpanded: controller.isFbExpanded.value,
                            icon: Icons.facebook,
                            label: 'Facebook',
                            color: Color(0xFF4267B2),
                            onTap: () => controller.handleFbTap(),
                          ),
                          SizedBox(width: 10),
                          SocialButton(
                            isExpanded: controller.isInstaExpanded.value,
                            icon: FontAwesomeIcons.instagram,
                            label: 'Instagram',
                            color: Color(0xFFE1306C),
                            onTap: () => controller.handleInstaTap(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: ListTile(
                title: Text('Log out', style: TextStyle(color: Colors.red)),
                leading: Icon(Icons.logout, color: Colors.red),
                trailing: Icon(CupertinoIcons.right_chevron, color: Colors.red),
                onTap: () async {
                  controller.showLogoutDialog(Get.context!);
                  // await controller.storage.clearAll();
                  // Get.offAllNamed(AppRoutes.signInScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget logOutButton({
    void Function()? onTap,
    required String text,
    required Color clr,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: clr,
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }

  static Widget logOutDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      title: const Text('Confirm Logout'),
      content: const Text('Are you sure you want to logout?'),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        logOutButton(
          text: 'Cancel',
          clr: ConstData.secondaryClr,
          onTap: () => Get.back(),
        ),
        logOutButton(
          text: 'Logout',
          clr: ConstData.primaryClr,
          onTap: () => ApiService().logOut(),
        ),
      ],
    );
  }
}
