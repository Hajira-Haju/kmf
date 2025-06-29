import 'dart:developer';

import 'package:associations_app/core/data/api_client/api_response_model/api_response_model.dart';
import 'package:associations_app/widgets/custom_widget/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiMethod {
  bool isBannerShowing = false;
  Future<ApiResponseModel> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (!isConnected && !isBannerShowing) {
      isBannerShowing = true;
      customBanner(
        msg: 'Make sure you have internet connection',
        clr: Colors.orange,
        onTap: () {
          ScaffoldMessenger.of(Get.context!).clearMaterialBanners();
          isBannerShowing = false;
        },
      );
    } else {
      isBannerShowing = false;
      ScaffoldMessenger.of(Get.context!).clearMaterialBanners();
    }
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      debugPrint('statusCode: ${response.statusCode}');
      debugPrint('body: ${response.body}');
      return ApiResponseModel(
        body: response.body,
        statusCode: response.statusCode,
      );
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      return ApiResponseModel(body: {}, statusCode: 0);
    }
  }

  Future<ApiResponseModel> post({
    required String url,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      debugPrint('statusCode: ${response.statusCode}');
      debugPrint('body: ${response.body}');
      return ApiResponseModel(
        body: response.body,
        statusCode: response.statusCode,
      );
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      return ApiResponseModel(body: {}, statusCode: 0);
    }
  }
}
