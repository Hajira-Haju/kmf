import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController());
    // TODO: implement dependencies
  }
}