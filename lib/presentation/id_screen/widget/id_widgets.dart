import 'dart:convert';

import 'package:associations_app/generated/assets.dart';
import 'package:associations_app/presentation/id_screen/controller/id_controller.dart';
import 'package:associations_app/presentation/id_screen/models/id_dats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IdWidgets {
  static Widget idDetails(IdController controller) {
    final qrData = jsonEncode(IdData.userData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('First Name'),
                Text(
                  'Test',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Column(
              children: [
                Text('Last Name'),
                Text(
                  'User',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Column(
              children: [
                Text('Gender'),
                Text(
                  'M',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        ListView.builder(
          itemCount: IdData.idData.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = IdData.idData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(height: 1),
                  ),
                  ListTile(
                    title: Text(data.head),
                    trailing: Text(
                      data.value,
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
                onTap: () => controller.showIdQr(),
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.orange,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Share Identity',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.verified, color: Colors.green, size: 50),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget qrWidget() {
    final qrData = jsonEncode(IdData.userData);
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
                        color: Colors.black,
                      ),
                      eyeStyle: QrEyeStyle(
                        eyeShape: QrEyeShape.circle,
                        color: Colors.black,
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
