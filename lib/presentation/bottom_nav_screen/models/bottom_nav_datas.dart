import 'package:associations_app/presentation/new_events_screen/news_events_screen.dart';
import 'package:associations_app/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../offers_screen/offers_screen.dart';

class BottomNavData {
  static List<Widget> pages = [NewsEventsScreen(), OffersScreen()];
  static Map<String, dynamic> userData = {
    'name': 'Test User',
    'email': 'test@skaktec.com',
    'id': 12345,
  };

  static List<DrawerModel> drawerData = [
    DrawerModel(
      icn: CupertinoIcons.person_alt,
      onTap: () {
        Get.to(ProfileScreen());
      },
      title: 'My Profile',
    ),
    DrawerModel(icn: CupertinoIcons.settings, onTap: () {}, title: 'Settings'),
    DrawerModel(
      icn: CupertinoIcons.person_2_fill,
      onTap: () {},
      title: 'Invite Friends',
    ),
    DrawerModel(icn: CupertinoIcons.star_fill, onTap: () {}, title: 'Rate us'),
    DrawerModel(
      icn: Icons.support_agent,
      onTap: () {},
      title: 'Help & support',
    ),
  ];
}

class DrawerModel {
  final IconData icn;
  final String title;
  final void Function()? onTap;
  DrawerModel({required this.icn, required this.onTap, required this.title});
}
