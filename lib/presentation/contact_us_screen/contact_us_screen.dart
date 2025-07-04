import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/contact_us_screen/controller/contact_us_controller.dart';
import 'package:associations_app/presentation/contact_us_screen/widget/contact_us_widget.dart';
import 'package:associations_app/widgets/custom_widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactUsController controller = Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
        backgroundColor: ConstData.secondaryClr,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const Text(
                'We would love to hear from you!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              ContactUsWidget.field(
                controller: controller.nameController,
                label: 'Name',
                prefix: Icons.person,
                validator:
                    (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 5),
              ContactUsWidget.field(
                maxLen: 8,
                keyboardType: TextInputType.phone,
                controller: controller.mobileController,
                label: 'Mobile No.',
                prefix: Icons.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter mobile number';
                  } else if (value.length < 8) {
                    return 'Please enter valid mobile number';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 5),
              ContactUsWidget.field(
                controller: controller.messageController,
                label: 'Message',
                prefix: Icons.message,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter mobile number' : null,
                maxLines: 5,
              ),
              SizedBox(height: 20),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: customButton(
                        isLoading: controller.isLoading.value,
                        fixedSize: Size(double.infinity, 50),
                        btnTxt: 'Submit',
                        onTap: () => controller.submitContactDetails(),
                      ),
                    ),
                  ],
                ),
              ),
              // ContactUsWidget.button(controller),
              const SizedBox(height: 30),

              // Submit Button
            ],
          ),
        ),
      ),
    );
  }
}
