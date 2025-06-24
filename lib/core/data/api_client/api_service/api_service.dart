import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:associations_app/core/data/api_client/api_list/api_list.dart';
import 'package:associations_app/core/data/api_client/api_method/api_method.dart';
import 'package:associations_app/presentation/id_screen/models/civil_id_model.dart';
import 'package:associations_app/presentation/offers_screen/model/offer_model.dart';
import 'package:associations_app/presentation/sign_in_screen/model/registration_model.dart';
import 'package:associations_app/widgets/custom_widget/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../presentation/id_screen/id_screen.dart';
import '../../../../routes/app_routes/app_routes.dart';
import '../../../Services/firebase_serrvice/firebase_service.dart';
import '../../../Services/storage_service/services.dart';
import '../../../Services/storage_service/storage_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final storage = StorageService();
  final api = ApiMethod();
  final firebase = FirebaseService();

  Future<RegistrationModel?> login({
    required String civilId,
    required String deviceId,
    required String deviceName,
    required String deviceModel,
    required String deviceType,
  }) async {
    try {
      final token = await firebase.init();
      final response = await api.post(
        url: ApiList.loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'CivilIdInput': civilId,
          'DeviceId': deviceId,
          'DeviceName': deviceName,
          'DeviceModel': deviceModel,
          'DeviceType': deviceType,
          'FCMToken': token,
        }),
      );
      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.otpScreen);
        final data = jsonDecode(response.body);
        await storage.write('otpReq', data['otpRequired']);
        await storage.write('civilId', data['civilId']);
        await storage.write('phone', data['phoneNumber']);
        await storage.write('token', data['token']);
        await storage.write('usrName', data['name']);
        return RegistrationModel.fromJson(data);
      } else {
        customSnackBar(msg: 'Something Went wrong');
        return null;
      }
    } catch (e, s) {
      customSnackBar(msg: 'Something Went wrong');
      log('Error Occurred', stackTrace: s, error: e);
      return null;
    }
  }

  Future<void> uploadImage({required File image}) async {
    final token = await storage.read('token');
    try {
      String filename = image.path.split("/").last;
      var request =
          http.MultipartRequest('POST', Uri.parse(ApiList.imageUploadUrl))
            ..headers['Authorization'] = 'Bearer $token'
            ..files.add(
              await http.MultipartFile.fromPath(
                'ImageData',
                image.path,
                filename: filename,
              ),
            );
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await http.Response.fromStream(response);
        debugPrint(responseBody.body);
        await storage.write('isLogged', true);
        Get.offAll(IdScreen(), arguments: {'canPop': false});
      } else {
        customSnackBar(msg: 'Something Went wrong');
        var errorBody = await http.Response.fromStream(response);
        debugPrint(errorBody.body);
      }
    } catch (e, s) {
      customSnackBar(msg: 'Something Went wrong');
      log('Error Occurred', stackTrace: s, error: e);
    }
  }

  Future<CivilIdModel?> fetchCivilData() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.civilId,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        customSnackBar(msg: 'Data Updated successfully');
        storage.write('civilIdData', response.body);
        final data = jsonDecode(response.body);
        return CivilIdModel.fromJson(data);
      } else {
        customSnackBar(msg: 'Something went wrong');
        debugPrint(response.body);
        return null;
      }
    } catch (e, s) {
      customSnackBar(msg: 'Something went wrong');
      log('Error occurred', error: e, stackTrace: s);
      return null;
    }
  }

  Future<List<OfferModel>> fetchOffer() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.offerUrl,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        await storage.write('offerData', response.body);
        final data = jsonDecode(response.body) as List;
        return data.map((e) => OfferModel.fromJson(e)).toList();
      } else {
        customSnackBar(msg: 'Something went wrong');
        return Services().loadOffersFromCache();
      }
    } catch (e, s) {
      customSnackBar(msg: 'Something went wrong');
      log('Error occurred', error: e, stackTrace: s);
      return Services().loadOffersFromCache();
    }
  }
}
