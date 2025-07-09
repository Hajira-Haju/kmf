import 'dart:io';

import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
import 'package:associations_app/presentation/welcome_screen/widget/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/Services/storage_service/storage_service.dart';

class WelcomeController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);
  final storage = StorageService();
  final apiService = ApiService();
  RxBool isLoading = false.obs;
  RxBool hasPerson = false.obs;
  RxBool showBanner = false.obs;
  String get userName => storage.read('usrName');

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      showBanner.value = true;
      selectedImage.value = File(pickedFile.path);
      hasPerson.value = await containsPerson(pickedFile.path);
    }
    // Now safely close the previous screen/dialog if needed
    if (Get.isBottomSheetOpen == true) {
      Get.back(); // or Get.close(1), based on your navigation stack
    }
  }

  void showOptions(WelcomeController controller) async {
    await Get.bottomSheet(WelcomeWidget.imageSelector(controller));
  }

  Future<bool> containsPerson(String imagePath) async {
    final inputImage = InputImage.fromFile(File(imagePath));
    final options = FaceDetectorOptions(
      enableClassification: true,
      enableLandmarks: true,
    );
    final faceDetector = FaceDetector(options: options);
    final faces = await faceDetector.processImage(inputImage);
    return faces.isNotEmpty;
  }

  Future<void> submitPhoto() async {
    isLoading.value = true;
    await apiService.uploadImage(image: selectedImage.value!);
    isLoading.value = false;
  }
}
