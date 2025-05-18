import 'package:associations_app/generated/assets.dart';
import 'package:associations_app/presentation/id_screen/controller/id_controller.dart';
import 'package:associations_app/presentation/id_screen/widget/id_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class IdScreen extends StatelessWidget {
  const IdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    IdController controller = Get.put(IdController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DIGITAL ID'),
        actions: [Text('Privacy   ')],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.orange,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/img_person.jpg', width: 150),
              ),
            ),
          ),
          IdWidgets.idDetails(controller),
        ],
      ),
    );
  }
}
