import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:associations_app/presentation/bottom_nav_screen/controller/bottom_nav_controller.dart';
import 'package:associations_app/presentation/bottom_nav_screen/models/bottom_nav_datas.dart';
import 'package:associations_app/presentation/bottom_nav_screen/widgets/bottom_nav_widgets.dart';
import 'package:associations_app/presentation/id_screen/id_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../notification_screen/notification_screen.dart';

class BottomNavScreen extends GetView<BottomNavController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => controller.key.currentState!.openDrawer(),
          child: Icon(Icons.grid_view_rounded),
        ),
        title: Text(
          'Associations',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
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
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      key: controller.key,
      drawer: BottomNavWidgets.drawer(),
      body: Obx(() => BottomNavData.pages[controller.activeIndex.value]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        onPressed: () =>Get.to(IdScreen(),transition: Transition.downToUp),
        child: Icon(CupertinoIcons.creditcard_fill),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          activeColor: Colors.orange,
          gapLocation: GapLocation.center,
          icons: [CupertinoIcons.news, Icons.local_offer_outlined],
          activeIndex: controller.activeIndex.value,
          onTap: (p0) => controller.activeIndex.value = p0,
        ),
      ),
    );
  }
}
