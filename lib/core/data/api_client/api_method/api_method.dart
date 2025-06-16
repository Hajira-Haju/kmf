import 'dart:developer';

import 'package:associations_app/core/data/api_client/api_response_model/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiMethod {
  Future<ApiResponseModel> get({
    required String url,
    Map<String, String>? headers,
  }) async {
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
