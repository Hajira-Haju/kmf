import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:associations_app/core/data/api_client/api_list/api_list.dart';
import 'package:associations_app/core/data/api_client/api_method/api_method.dart';
import 'package:associations_app/presentation/bottom_nav_screen/controller/bottom_nav_controller.dart';
import 'package:associations_app/presentation/id_screen/models/civil_id_model.dart';
import 'package:associations_app/presentation/new_events_screen/controller/news_events_controller.dart';
import 'package:associations_app/presentation/new_events_screen/models/event_type_model.dart';
import 'package:associations_app/presentation/new_events_screen/models/news_and_events_model.dart';
import 'package:associations_app/presentation/offers_screen/model/offer_model.dart';
import 'package:associations_app/presentation/sign_in_screen/model/registration_model.dart';
import 'package:associations_app/widgets/custom_widget/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../presentation/id_screen/id_screen.dart';
import '../../../../presentation/notification_screen/models/notification_model.dart';
import '../../../../presentation/officials_screen/model/officials_model.dart';
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

  Future<void> loggedStatus(int type) async {
    final token = storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.loggedStatus(type),
        headers: {'Authorization': 'Bearer $token'},
      );
    } catch (e, s) {
      log('Error occurred', stackTrace: s, error: e);
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

  Future<List<NewsAndEventsModel>> fetchLatest() async {
    BottomNavController bottomNav = Get.find();
    final token = storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.newsAndEventsUrl(type: 0, pageNo: 1),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        await storage.write('latestUpdates', response.body);
        final data = jsonDecode(response.body);
        bottomNav.isUnread.value = data['isUnread'];
        final newsAndEvents = data['newsOrEventsData'] as List;
        return newsAndEvents
            .map((e) => NewsAndEventsModel.fromJson(e))
            .toList();
      } else {
        customSnackBar(msg: 'Something went wrong');
        return Services().loadLatestFromCache();
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      return Services().loadLatestFromCache();
    }
  }

  Future<List<EventTypeModel>> fetchEventType() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.eventType,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        await storage.write('eventType', response.body);
        final data = jsonDecode(response.body) as List;
        return data.map((e) => EventTypeModel.fromJson(e)).toList();
      } else {
        return Services().loadEventTypeFromCache();
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      return Services().loadEventTypeFromCache();
    }
  }

  Future<Map<String, dynamic>> fetchNewsOrEvents(int type, int page) async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.newsAndEventsUrl(type: type, pageNo: page),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> list = jsonData['newsOrEventsData'];
        final int nextPage = jsonData['nextPageNumber'];
        if (page == 1 && list.isNotEmpty) {
          await storage.write('newsOrEvents', response.body);
        }
        return {
          'list': list.map((e) => NewsAndEventsModel.fromJson(e)).toList(),
          'nextPage': nextPage,
        };
      } else {
        log('Failed to load from server');
        final cachedList = await Services().loadNewsOrEventsFromCache();
        return {'list': cachedList, 'nextPage': 0};
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      final cachedList = await Services().loadNewsOrEventsFromCache();
      return {'list': cachedList, 'nextPage': 0};
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
      log('Error occurred', error: e, stackTrace: s);
      return Services().loadOffersFromCache();
    }
  }

  Future<void> contactUs({
    required String name,
    required String description,
    required String contactNo,
    required int type,
  }) async {
    final token = await storage.read('token');
    try {
      final response = await api.post(
        url: ApiList.contactUs,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'description': description,
          'contactNo': contactNo,
          'Type': type,
        }),
      );
      if (response.statusCode == 200) {
        await storage.write(
          'last_support_time',
          DateTime.now().toIso8601String(),
        );
        Get.snackbar(
          'Your message sent successfully',
          'We will contact you soon...',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
        if (type == 2) {
          Get.offAllNamed(AppRoutes.bottomNavScreen);
        }
      } else {
        customSnackBar(msg: 'Something went wrong');
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      customSnackBar(msg: 'Something went wrong');
    }
  }

  Future<dynamic> fetchAboutUs() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        headers: {'Authorization': 'Bearer $token'},
        url: ApiList.aboutUs,
      );
      if (response.statusCode == 200) {
        await storage.write('aboutUs', response.body);
        final data = jsonDecode(response.body);
        return data['htmlContent'];
      } else {
        customSnackBar(msg: 'Something went wrong');
        return Services().loadAboutUsFromCache();
      }
    } catch (e, s) {
      customSnackBar(msg: 'Failed to Update');
      log('Error occurred', error: e, stackTrace: s);
      return Services().loadAboutUsFromCache();
    }
  }

  Future<dynamic> fetchReferAFriend() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        headers: {'Authorization': 'Bearer $token'},
        url: ApiList.referFriend,
      );
      if (response.statusCode == 200) {
        await storage.write('referAFriend', response.body);
        final data = jsonDecode(response.body);
        return data['htmlContent'];
      } else {
        customSnackBar(msg: 'Something went wrong');
        return Services().loadReferAFriendFromCache();
      }
    } catch (e, s) {
      customSnackBar(msg: 'Failed to Update');
      log('Error occurred', error: e, stackTrace: s);
      return Services().loadReferAFriendFromCache();
    }
  }

  Future<dynamic> fetchQuickContact() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        headers: {'Authorization': 'Bearer $token'},
        url: ApiList.quickContact,
      );
      if (response.statusCode == 200) {
        await storage.write('quickContact', response.body);
        final data = jsonDecode(response.body);
        return data['htmlContent'];
      } else {
        customSnackBar(msg: 'Something went wrong');
        return Services().loadQuickContactFromCache();
      }
    } catch (e, s) {
      customSnackBar(msg: 'Failed to Update');
      log('Error occurred', error: e, stackTrace: s);
      return Services().loadQuickContactFromCache();
    }
  }

  Future<List<OfficialsModel>> fetchOfficialsData() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.officials,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        await storage.write('officialsData', response.body);
        final List jsonData = jsonDecode(response.body);
        return jsonData.map((e) => OfficialsModel.fromJson(e)).toList();
      } else {
        customSnackBar(msg: 'Something went wrong');
        debugPrint(response.body);
        return Services().loadOfficialsFromCache();
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      customSnackBar(msg: 'Failed to Update');
      return Services().loadOfficialsFromCache();
    }
  }

  Future<List<NotificationList>> fetchNotification() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.notificationUrl,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final notification = data['notificationList'] as List;
        return notification.map((e) => NotificationList.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
      return [];
    }
  }

  Future<void> deleteNotification(int id) async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.deleteNotificationUrl(id),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        customSnackBar(msg: 'Deleted successfully!');
      } else {
        customSnackBar(msg: 'Failed to delete');
      }
    } catch (e, s) {
      log('Error occurred', error: e, stackTrace: s);
    }
  }

  Future<void> logOut() async {
    final token = await storage.read('token');
    try {
      final response = await api.get(
        url: ApiList.logOut,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        await storage.clearAll();
        Get.offAllNamed(AppRoutes.signInScreen);
      } else {
        customSnackBar(msg: 'Failed to Logout. Try again later...');
      }
    } catch (e, s) {
      customSnackBar(msg: 'Failed to Logout. Try again later...');
      log('Error occurred', error: e, stackTrace: s);
    }
  }
}
