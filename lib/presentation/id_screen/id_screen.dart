import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/generated/assets.dart';
import 'package:associations_app/presentation/id_screen/controller/id_controller.dart';
import 'package:associations_app/presentation/id_screen/widget/id_widgets.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class IdScreen extends StatelessWidget {
  IdScreen({super.key});
  @override
  Widget build(BuildContext context) {
    IdController controller = Get.put(IdController());
    return PopScope(
      canPop: controller.canPop,
      onPopInvokedWithResult:
          (didPop, result) =>
              controller.canPop
                  ? null
                  : Get.offAllNamed(AppRoutes.bottomNavScreen),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap:
                () =>
                    controller.canPop
                        ? Get.back()
                        : Get.offAllNamed(AppRoutes.bottomNavScreen),
            child: Icon(Icons.close, color: ConstData.secondaryClr),
          ),
          centerTitle: true,
          title: Text('MY DIGITAL ID'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Refreshing ID...')));
                },
                child: Icon(Icons.refresh, color: ConstData.secondaryClr),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: ConstData.secondaryClr,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/img_person.jpg', width: 150),
                  ),
                ),
              ),
              IdWidgets.idDetails(controller),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
