import 'package:associations_app/presentation/officials_screen/controller/official_controller.dart';
import 'package:get/get.dart';

class OfficialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OfficialController());
    // TODO: implement dependencies
  }
}
