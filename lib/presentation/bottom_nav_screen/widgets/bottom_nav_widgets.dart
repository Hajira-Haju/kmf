import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Image.asset('assets/the-associates_logo.png', width: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(color: Colors.grey),
                ),
                SizedBox(width: double.infinity, height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/img_person.jpg', width: 100),
                ),
                SizedBox(height: 10),
                Text(
                  'Test User',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'test@skaktec.com',
                  style: TextStyle(color: Colors.grey.shade700),
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
                      leading: Icon(data.icn),
                      title: Text(data.title),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      onTap: data.onTap,
                    );
                  },
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
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
