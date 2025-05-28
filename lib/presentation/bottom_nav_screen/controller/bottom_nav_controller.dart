import 'package:associations_app/presentation/bottom_nav_screen/widgets/bottom_nav_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../id_screen/id_screen.dart';

class BottomNavController extends GetxController {
  final arg = Get.arguments;
  RxInt activeIndex = 0.obs;
  final key = GlobalKey<ScaffoldState>();



}
