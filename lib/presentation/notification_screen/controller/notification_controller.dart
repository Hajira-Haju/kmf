import 'dart:math';
import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
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
}
