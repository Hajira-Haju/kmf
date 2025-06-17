import 'dart:convert';
import 'dart:developer';
import 'package:associations_app/core/data/api_client/api_list/api_list.dart';
import 'package:associations_app/core/data/api_client/api_method/api_method.dart';
 import 'package:associations_app/presentation/sign_in_screen/model/registration_model.dart';
import 'package:associations_app/widgets/custom_widget/custom_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_routes/app_routes.dart';
import '../../../Services/storage_service/storage_service.dart';

class ApiService {
  final storage = StorageService();
  final api = ApiMethod();
  Future<RegistrationModel?> login({
    required String civilId,
    required String deviceId,
    required String deviceName,
    required String deviceModel,
    required String deviceType,
  }) async {
    try {
      final response = await api.post(
        url: ApiList.loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'CivilIdInput': civilId,
          'DeviceId': deviceId,
          'DeviceName': deviceName,
          'DeviceModel': deviceModel,
          'DeviceType': deviceType,
        }),
      );
      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.otpScreen);
        final data = jsonDecode(response.body);
        await storage.write('otpReq', data['otpRequired']);
        await storage.write('civilId', data['civilId']);
        await storage.write('phone', data['phoneNumber']);
        await storage.write('token', data['token']);
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
}
