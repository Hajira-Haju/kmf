import 'package:associations_app/presentation/otp_screen/controller/otp_controller.dart';
import 'package:get/get.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OtpController());
    // TODO: implement dependencies
  }
}