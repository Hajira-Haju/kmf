import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:associations_app/presentation/bottom_nav_screen/widgets/bottom_nav_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
