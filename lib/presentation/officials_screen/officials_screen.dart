import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/officials_screen/controller/official_controller.dart';
import 'package:associations_app/presentation/officials_screen/widgets/officials_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficialsScreen extends GetView<OfficialController> {
  const OfficialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Officials'),
        centerTitle: true,
        backgroundColor: ConstData.secondaryClr,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Meet the dedicated team leading KMF Kuwait with vision and commitment.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], fontSize: 20),
                ),
              ),
            ),
            // const SizedBox(height: 24),
            OfficialsWidgets.listViewWithGrid(controller),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
