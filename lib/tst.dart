import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceInfoScreen extends StatefulWidget {
  @override
  _DeviceInfoScreenState createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  String? deviceId = '';
  String? deviceModel = '';
  String? deviceName = '';
  String deviceOs = '';

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceId = androidInfo.id;
        deviceModel = androidInfo.model;
        deviceName = androidInfo.device;
        deviceOs = 'android';
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceId = iosInfo.identifierForVendor ?? 'Unknown';
        deviceModel = iosInfo.utsname.machine;
        deviceName = iosInfo.name;
        deviceOs = 'ios';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Device Info')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Device ID: $deviceId', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Model: $deviceModel', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Device Name: $deviceName', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Device OS: $deviceOs', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
