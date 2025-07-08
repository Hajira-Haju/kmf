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
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.people_alt_rounded,
                color: ConstData.secondaryClr,
                size: 50,
              ),
            ),
            const SizedBox(height: 12),
            Text(textAlign: TextAlign.center,
              'Executive Committee Members',
              style: TextStyle(
                color: ConstData.primaryClr,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Meet the dedicated team leading KMF Kuwait with vision and commitment.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
            OfficialsWidgets.listViewWithGrid(controller),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
