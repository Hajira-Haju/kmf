// import 'package:flutter/material.dart';
//
// void main() => runApp(SocialButtonDemo());
//
// class SocialButtonDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Social Buttons Demo',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey,
//         body: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SocialButton(
//                 icon: Icons.facebook,
//                 label: 'Facebook',
//                 color: Color(0xFF4267B2),
//                 onTap: () => print('Facebook clicked'),
//               ),
//               SocialButton(
//                 icon: Icons.camera_alt,
//                 label: 'Instagram',
//                 color: Color(0xFFE1306C),
//                 onTap: () => print('Instagram clicked'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SocialButton extends StatefulWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;
//
//   const SocialButton({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   _SocialButtonState createState() => _SocialButtonState();
// }
//
// class _SocialButtonState extends State<SocialButton> {
//   bool isExpanded = false;
//
//   void toggleExpand() {
//     setState(() {
//       isExpanded = !isExpanded;
//     });
//     widget.onTap(); // You can remove this if tap should only expand/collapse
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: toggleExpand,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         width: isExpanded ? 200 : 60,
//         height: 60,
//         // padding: const EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(50),
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//         ),
//         child: Row(
//           children: [
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: isExpanded ? widget.color : Colors.transparent,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 widget.icon,
//                 color: isExpanded ? Colors.white : Colors.black,
//                 size: 24,
//               ),
//             ),
//             SizedBox(width: isExpanded ? 10 : 0),
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               width: isExpanded ? 120 : 0, // dynamically animates width
//               curve: Curves.easeOut,
//               child: AnimatedOpacity(
//                 duration: const Duration(milliseconds: 300),
//                 opacity: isExpanded ? 1.0 : 0.0,
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     widget.label,
//                     overflow: TextOverflow.clip,
//                     softWrap: false,
//                     style: TextStyle(
//                       color: widget.color,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
