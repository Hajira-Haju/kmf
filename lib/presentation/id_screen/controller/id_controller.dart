import 'dart:convert';

import 'package:associations_app/presentation/id_screen/models/civil_id_model.dart';
import 'package:associations_app/presentation/id_screen/widget/id_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/Services/storage_service/storage_service.dart';
import '../../../core/data/api_client/api_service/api_service.dart';
import '../models/id_dats.dart';

class IdController extends GetxController {
  final arg = Get.arguments;
  bool get canPop => arg['canPop'];
  final apiService = ApiService();
  final storage = StorageService();
  late Future<CivilIdModel?> futureCivilId;

  @override
  void onInit() {
    super.onInit();
    if (storage.read('civilIdData') == null) {
      futureCivilId = fetchCivilIdFromLocal(true);
    } else {
      futureCivilId = fetchCivilIdFromLocal(false);
    }
  }

  Future<void> fetchCivilDataLive() async {
    futureCivilId = fetchCivilIdFromLocal(true);
  }

  Future<CivilIdModel> fetchCivilIdFromLocal(bool isLive) async {
    if (isLive) {
      await apiService.fetchCivilData();
    }
    final data = await storage.read('civilIdData');
    final civilIdData = jsonDecode(data);
    return CivilIdModel.fromJson(civilIdData);
  }

  void showIdQr(CivilIdModel data) {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) => IdWidgets.qrWidget(data),
    );
  }
}
