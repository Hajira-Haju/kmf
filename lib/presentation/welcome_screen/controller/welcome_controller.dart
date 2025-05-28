import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WelcomeController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }
}
