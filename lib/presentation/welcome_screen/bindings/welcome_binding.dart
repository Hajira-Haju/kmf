import 'package:associations_app/presentation/welcome_screen/controller/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WelcomeController());
    // TODO: implement dependencies
  }
}