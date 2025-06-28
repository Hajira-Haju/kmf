import 'package:associations_app/presentation/refer_member_screen/controller/refer_member_controller.dart';
import 'package:get/get.dart';

class ReferMemberBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ReferMemberController());
    // TODO: implement dependencies
  }
}