import 'dart:io';

import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/Services/storage_service/storage_service.dart';

class WelcomeController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);
  final storage = StorageService();
  final apiService = ApiService();
  RxBool isLoading = false.obs;
  String get userName => storage.read('usrName');
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> submitPhoto() async {
    isLoading.value = true;
    await apiService.uploadImage(image: selectedImage.value!);
    isLoading.value = false;
  }
}
