import 'package:get/get.dart';

import '../controller/quick_contact_controller.dart';

class QuickContactBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(QuickContactController());
    // TODO: implement dependencies
  }
}