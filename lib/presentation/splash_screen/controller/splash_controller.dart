import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/Services/storage_service/storage_service.dart';

class SplashController extends GetxController {
  final storage = StorageService();
  get isLogged => storage.read('isLogged');
  final api = ApiService();
  @override
  void onInit() {
    // TODO: implement onInit
    navigate();
    super.onInit();
  }

  void navigate() {
    Future.delayed(Duration(seconds: 2), () {
      if (isLogged == null) {

        Get.offAllNamed(AppRoutes.signInScreen);
      } else {
        ///to update log in db
        api.loggedStatus(1);
        Get.offAllNamed(AppRoutes.bottomNavScreen);
      }
    });
  }
}
