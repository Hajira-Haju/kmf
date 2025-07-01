import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/bottom_nav_screen/controller/bottom_nav_controller.dart';
import 'package:associations_app/presentation/bottom_nav_screen/models/bottom_nav_datas.dart';
import 'package:associations_app/presentation/bottom_nav_screen/widgets/bottom_nav_widgets.dart';
import 'package:associations_app/presentation/id_screen/id_screen.dart';
import 'package:associations_app/res/assets_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../notification_screen/notification_screen.dart';

class BottomNavScreen extends GetView<BottomNavController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.lastBackPressed == null ||
            controller.now.difference(controller.lastBackPressed!) >
                const Duration(seconds: 2)) {
          controller.lastBackPressed = controller.now;
          Fluttertoast.showToast(msg: "Press back again to exit");
          return false;
        }
        controller.updateLogStatus();
        return true; // Will exit
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => controller.key.currentState!.openDrawer(),
            child: Icon(Icons.grid_view_rounded, color: ConstData.secondaryClr),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(AssetsRes.THE_ASSOCIATES_LOGO, width: 30),
              ),
              SizedBox(width: 5),
              Text(
                'K M F',
                style: TextStyle(
                  color: ConstData.primaryClr,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap:
                    () => Get.to(
                      NotificationScreen(),
                      transition: Transition.rightToLeftWithFade,
                    ),
                child: Icon(Icons.notifications, color: ConstData.secondaryClr),
              ),
            ),
          ],
        ),
        key: controller.key,
        drawer: BottomNavWidgets.drawer(controller),
        body: Obx(() {
          final page = BottomNavData.pages[controller.activeIndex.value];
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: page,
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ConstData.secondaryClr,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          onPressed:
              () => Get.to(
                IdScreen(),
                transition: Transition.downToUp,
                arguments: {'canPop': true},
              ),
          child: Icon(CupertinoIcons.creditcard_fill),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return AnimatedBottomNavigationBar(
            backgroundColor: isDark ? Colors.grey.shade900 : Colors.white,
            activeColor: ConstData.primaryClr,
            gapLocation: GapLocation.center,
            icons: [CupertinoIcons.news, Icons.local_offer_outlined],
            activeIndex: controller.activeIndex.value,
            onTap: (p0) => controller.activeIndex.value = p0,
          );
        }),
      ),
    );
  }
}
