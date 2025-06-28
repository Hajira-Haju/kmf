import 'package:associations_app/presentation/contact_us_screen/contact_us_screen.dart';
import 'package:associations_app/presentation/new_events_screen/news_events_screen.dart';
import 'package:associations_app/presentation/quick_contact_screen/quick_contact_screen.dart';
import 'package:associations_app/presentation/refer_member_screen/refer_member_screen.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../about_screen/about_screen.dart';
import '../../offers_screen/offers_screen.dart';
import '../../officials_screen/officials_screen.dart';

class BottomNavData {
  static List<Widget> pages = [NewsEventsScreen(), OffersScreen()];
  static Map<String, dynamic> userData = {
    'name': 'Test User',
    'email': 'test@skaktec.com',
    'id': 12345,
  };

  static List<DrawerModel> drawerData = [
    DrawerModel(
      icn: Icons.new_releases,
      onTap: () => Get.toNamed(AppRoutes.aboutUs),
      title: 'About KMF Kuwait',
    ),
    DrawerModel(
      icn: CupertinoIcons.rectangle_on_rectangle_angled,
      onTap: () => Get.to(OfficialsScreen()),
      title: 'Officials',
    ),
    DrawerModel(
      icn: Icons.app_registration,
      onTap: () => Get.toNamed(AppRoutes.referScreen),
      title: 'Refer a Member',
    ),
    DrawerModel(
      icn: Icons.quick_contacts_dialer,
      onTap: () => Get.toNamed(AppRoutes.quickContactScreen),
      title: 'Quick Contact',
    ),
    DrawerModel(
      icn: Icons.contact_mail_sharp,
      onTap: () => Get.to(ContactUsScreen()),
      title: 'Contact Us',
    ),
  ];
}

class DrawerModel {
  final IconData icn;
  final String title;
  final void Function()? onTap;
  DrawerModel({required this.icn, required this.onTap, required this.title});
}
