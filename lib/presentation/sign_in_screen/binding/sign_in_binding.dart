import 'package:associations_app/presentation/sign_in_screen/controller/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    // TODO: implement dependencies
  }
}
