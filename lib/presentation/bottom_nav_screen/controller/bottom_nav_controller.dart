import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:associations_app/presentation/bottom_nav_screen/widgets/bottom_nav_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/Services/storage_service/storage_service.dart';
import '../../id_screen/id_screen.dart';

class BottomNavController extends GetxController with WidgetsBindingObserver {
  final storage = StorageService();
  final arg = Get.arguments;
  RxInt activeIndex = 0.obs;
  final key = GlobalKey<ScaffoldState>();
  final now = DateTime.now();
  final api = ApiService();
  DateTime? lastBackPressed;
  RxBool isUnread = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      updateLogStatus();
    }
  }

  Future<void> updateLogStatus() async {
    await api.loggedStatus(2);
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BottomNavWidgets.logOutDialog(context),
    );
  }

  Future<void> launchUrlTo(String urlData) async {
    final Uri url = Uri.parse(urlData);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
