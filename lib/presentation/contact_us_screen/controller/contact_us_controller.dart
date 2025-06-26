import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final messageController = TextEditingController();
  RxBool isLoading = false.obs;
  final api = ApiService();

  Future<void> submitContactDetails() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await api.contactUs(
        name: nameController.text,
        description: messageController.text,
        contactNo: mobileController.text,
        type: 2,
      );
    }
    isLoading.value = false;
  }
}
