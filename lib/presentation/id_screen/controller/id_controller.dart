import 'dart:convert';

import 'package:associations_app/presentation/id_screen/widget/id_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/id_dats.dart';

class IdController extends GetxController {
  void showIdQr() {
    showModalBottomSheet(context: Get.context!, builder: (context) => IdWidgets.qrWidget(),);

  }
}
