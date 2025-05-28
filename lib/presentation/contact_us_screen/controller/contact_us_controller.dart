import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final messageController = TextEditingController();
}