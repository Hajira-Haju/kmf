// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
//  import '../../generated/assets.dart';
//
// class  ProfileScreen extends StatelessWidget {
//   const  ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//       return  SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text('PROFILE',),),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(height: 50),
//                 Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.asset(Assets.assetsImgPerson, width: 150)
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'USER NAME',
//                           style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
//
//                         )
//                       ],
//                     )
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'Contact No:\n+91 9876543210',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//             SizedBox(height: 50),
//             Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//                 child: Column(
//                   children: [
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text('Profile',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,),)),
//                     ListTile(
//                       leading: Image.asset(
//                         'assets/profile.png',
//                         width: 24,
//                         height: 24,
//                       ),
//                       title: Text('Edit Profile'),
//                       trailing: Container(
//                         padding: EdgeInsets.all(6), // Adjust padding as needed
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade300, // Background color
//                           borderRadius: BorderRadius.circular(8), // Rounded corners
//                           // Optional: border
//                           // border: Border.all(color: Colors.grey),
//                         ),
//                         child: Icon(Icons.arrow_forward_ios, size: 16),
//                       ),
//                       onTap: () {
//                         Get.to(EditProfile());
//                       },
//                     ),
//                     SizedBox(height: 20,),
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text('Settings',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,),)),
//                     Obx(() => ListTile(
//                       leading: Image.asset(
//                         'assets/sign.png',
//                         width: 24,
//                         height: 24,
//                       ),
//                       title: Text('Notification'),
//                       trailing: Switch(
//                         value: notificationController.isNotificationEnabled.value,
//                         onChanged: (value) {
//                           notificationController.toggleNotification(value);
//                         },
//                         activeColor: Colors.black26,
//                       ),
//                       onTap: () {
//                         notificationController.toggleNotification(!notificationController.isNotificationEnabled.value);
//                       },
//                     ),
//                     ),
//
//
//                     Obx(() => ListTile(
//                       leading: Image.asset(
//                         'assets/dark-mode.png',
//                         width: 24,
//                         height: 24,
//                       ),
//                       title: Text('Dark Mode'),
//                       trailing: Switch(
//                         value: themeController.isDarkMode.value,
//                         onChanged: (value) {
//                           themeController.toggleTheme(value);
//                         },
//                         activeColor: Colors.black26,
//                       ),
//                       onTap: () {
//
//                       },
//                     ),
//                     ),
//
//
//                     SizedBox(height: 20),
//
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.grey.shade300, // Background color
//                         padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 2,
//                       ),
//                       icon: Icon(Icons.logout, color: Colors.black),
//                       label: Text('Sign Out', style: TextStyle(color: Colors.black)),
//                       onPressed: () {
//
//                       },
//                     )
//                   ],
//                 )
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
