import 'dart:io';

import 'package:associations_app/core/data/api_client/api_service/api_service.dart';
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
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      showBanner.value=true;
      selectedImage.value = File(pickedFile.path);
      hasPerson.value = await containsPerson(pickedFile.path);
    }
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
