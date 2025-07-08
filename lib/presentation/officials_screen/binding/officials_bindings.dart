import 'package:associations_app/presentation/officials_screen/controller/officials_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class OfficialsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OfficialsController());
  }

}