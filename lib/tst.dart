import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class PersonCapturePage extends StatelessWidget {
  const PersonCapturePage({super.key});

  Future<void> captureAndCheck(BuildContext context) async {
    final imagePath = await pickImage();
    if (imagePath == null) return;

    final hasPerson = await containsPerson(imagePath);
    if (hasPerson) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ This is a person!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ No person detected, try another photo.')),
      );
    }
  }

  Future<String?> pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image?.path;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => captureAndCheck(context),
            child: const Text('Capture Image')),
      ),
    );
  }
}
