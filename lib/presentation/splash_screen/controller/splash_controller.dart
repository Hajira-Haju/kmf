import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../core/Services/storage_service/storage_service.dart';

class SplashController extends GetxController {
  final storage = StorageService();
  get isLogged => storage.read('isLogged');
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
        Get.offAllNamed(AppRoutes.bottomNavScreen);
      }
    });
  }
}
