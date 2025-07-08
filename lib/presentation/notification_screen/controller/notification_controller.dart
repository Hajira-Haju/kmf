import 'dart:math';
import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {
  final api = ApiService();
  RxBool isLoading = false.obs;
  var notifications = <NotificationList>[].obs;
  final random = Random();
  @override
  void onInit() {
    // TODO: implement onInit
    fetchNotification();
    super.onInit();
  }

  void fetchNotification() async {
    isLoading.value = true;
    notifications.value = await api.fetchNotification();
    isLoading.value = false;
  }

  void showNotification(String title, String body, BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            title: Text(title),
            content: SingleChildScrollView(child: Text(body)),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ConstData.secondaryClr,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                onPressed: () => Navigator.pop(Get.context!),
                child: Text('Close'),
              ),
            ],
          ),
    );
  }
}
