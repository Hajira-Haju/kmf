import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../generated/assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PROFILE')),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            Assets.assetsImgPerson,
                            width: 150,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Test User',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text('test@skaktech.com'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Contact No\n+91 9876543210',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/profile.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('Edit Profile'),
                      trailing: Container(
                        padding: EdgeInsets.all(6), // Adjust padding as needed
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300, // Background color
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // Rounded corners
                          // Optional: border
                          // border: Border.all(color: Colors.grey),
                        ),
                        child: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/sign.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('Notification'),
                      trailing: Switch(
                        value: true,
                        activeTrackColor: ConstData.primaryClr,
                        thumbColor: WidgetStatePropertyAll(Colors.white),
                        onChanged: (value) {},
                        activeColor: Colors.black26,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/dark-mode.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('Dark Mode'),
                      trailing: Switch(
                        value: false,
                        activeTrackColor: ConstData.primaryClr,
                        thumbColor: WidgetStatePropertyAll(Colors.white),
                        onChanged: (value) {},
                        activeColor: Colors.black26,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 20.w,
            right: 20.w,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              icon: Icon(Icons.logout),
              label: Text('Sign Out'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
