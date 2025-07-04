import 'dart:convert';

import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/generated/assets.dart';
import 'package:associations_app/presentation/id_screen/controller/id_controller.dart';
import 'package:associations_app/presentation/id_screen/models/civil_id_model.dart';
import 'package:associations_app/presentation/id_screen/models/id_dats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

class IdWidgets {
  static Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: ConstData.shimmerClrBase(Get.context!),
      highlightColor: ConstData.shimmerClrHighLight(Get.context!),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: ConstData.secondaryClr,
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            itemCount: 6,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                child: SizedBox(height: 60),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget idDetails(IdController controller, CivilIdModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            data.membername!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            title: Text('Status'),
            trailing: Text(
              data.paymentStatus! ? 'Payment Completed' : 'Payment Pending',
              style: TextStyle(
                color: data.paymentStatus! ? Colors.green : Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListView.builder(
          itemCount: IdData(data).idData.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final value = IdData(data).idData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(height: 1),
                  ),
                  ListTile(
                    title: Text(value.head, overflow: TextOverflow.ellipsis),
                    trailing: Text(
                      value.value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => controller.showIdQr(data),
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: ConstData.primaryClr,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Icon(CupertinoIcons.qrcode, size: 30),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Share Identity',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget qrWidget(CivilIdModel data) {
    final qrData = jsonEncode(IdData(data).userData);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BottomSheet(
        showDragHandle: true,
        onClosing: () {},
        builder:
            (context) => SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'DIGITAL ID',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Card(
                    color: Colors.white,
                    child: QrImageView(
                      dataModuleStyle: QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.circle,
                        color: ConstData.secondaryClr,
                      ),
                      eyeStyle: QrEyeStyle(
                        eyeShape: QrEyeShape.circle,
                        color: ConstData.secondaryClr,
                      ),

                      data: qrData,
                      version: QrVersions.auto,
                      size: 200.0,
                      gapless: false,
                    ),
                  ),
                  Text('Scan to Share details'),
                  SizedBox(height: 40),
                ],
              ),
            ),
      ),
    );
  }
}
