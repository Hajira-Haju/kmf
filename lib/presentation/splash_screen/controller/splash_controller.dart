import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    navigate();
    super.onInit();
  }

  void navigate() {
    Future.delayed(
      Duration(seconds: 3),
      () => Get.offAllNamed(AppRoutes.signInScreen),
    );
  }
}
