import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/contact_us_screen/controller/contact_us_controller.dart';
import 'package:associations_app/presentation/contact_us_screen/widget/contact_us_widget.dart';
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
                prfix: Icons.person,
                validator:
                    (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              const SizedBox(height: 20),
              ContactUsWidget.field(
                controller: controller.mobileController,
                label: 'Mobile No.',
                prfix: Icons.phone,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter mobile number' : null,
              ),

              const SizedBox(height: 20),
              ContactUsWidget.field(
                controller: controller.messageController,
                label: 'Message',
                prfix: Icons.message,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter mobile number' : null,
                maxLines: 5,
              ),
              SizedBox(height: 20),
              ContactUsWidget.button(controller),
              const SizedBox(height: 30),

              // Submit Button
            ],
          ),
        ),
      ),
    );
  }
}
