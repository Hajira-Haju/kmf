import 'package:associations_app/presentation/contact_us_screen/controller/contact_us_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/const_datas.dart';

class ContactUsWidget {
  static Widget field({
    required TextEditingController controller,
    required String label,
    required IconData prfix,
    int? maxLines,
    int? maxLen,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      maxLength: maxLen,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        helperText: '',
        labelText: label,
        prefixIcon: Icon(prfix),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator,
    );
  }

  // static Widget button(ContactUsController controller) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         if (controller.formKey.currentState!.validate()) {
  //           // You can handle submission logic here
  //           ScaffoldMessenger.of(
  //             Get.context!,
  //           ).showSnackBar(const SnackBar(content: Text('Message Sent!')));
  //         }
  //       },
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: ConstData.primaryClr,
  //         padding: const EdgeInsets.symmetric(vertical: 14),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //       ),
  //       child: const Text(
  //         'Submit',
  //         style: TextStyle(fontSize: 16, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }
}
