import 'dart:convert';

import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../generated/assets.dart';
import '../controller/bottom_nav_controller.dart';
import '../models/bottom_nav_datas.dart';

class BottomNavWidgets {
  static Widget drawer() {
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
            Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/insta_logo.svg', width: 40),
                    SvgPicture.asset('assets/fb_logo.svg', width: 40),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: ListTile(
                title: Text('Log out', style: TextStyle(color: Colors.red)),
                leading: Icon(Icons.logout, color: Colors.red),
                trailing: Icon(CupertinoIcons.right_chevron, color: Colors.red),
                onTap: () => Get.offAllNamed(AppRoutes.signInScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
