import 'package:associations_app/presentation/about_screen/controller/about_us_controller.dart';
import 'package:get/get.dart';

class AboutUsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AboutUsController());
  }
}
