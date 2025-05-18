import 'package:associations_app/presentation/news_inner_screen/controller/news_inner_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsInnerScreen extends GetView<NewsInnerController> {
  const NewsInnerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 250.h,
                child: Image.network(
                  controller.imgUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withValues(alpha: .7),
                    foregroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey.withValues(alpha: .7),
                  foregroundColor: Colors.white,
                  child: Icon(CupertinoIcons.ellipsis_vertical),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 220.h,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          'Alexander wears modified helmets in road races',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "The Online News Association’s Board of Directors has elected Andrew Fitzgerald, Senior Vice President of Streaming Video Services at Hearst Television, as the new ONA Board Vice President, and Ryan Kellett, a 2025 Nieman-Berkman Klein Fellow in Journalism Innovation at Harvard University, as the new Treasurer. The board voted on these executive committee positions during the April 2025 meeting, after Niketa Patel stepped down from the Vice President role to lead ONA as the Executive Director/CEO. ONA’s board leadership also includes Charo Henríquez, President, and Angela Pacienza, Secretary. Andrew Fitzgerald joined the board in 2021, bringing significant leadership experience in local news content and revenue strategies to guide ONA’s mission. He has led initiatives to expand digital content and streaming across Hearst Television’s local stations and emerging platforms, including through the Very Local app. Andrew previously served as ONA Board Treasurer for over two years. Ryan Kellett joined the ONA board in 2024 and is now serving in his first role on the executive committee. As a Nieman-Berkman Klein Fellow, he is currently researching how creator journalism is changing the media market. Ryan also co-leads the online workshop Going Solo for journalists working to build independent ventures and most notably shares tools and strategies for audience growth, learned from his years transforming editorial and audience strategy for outlets like The Washington Post and Axios. Seats on the ONA board are filled through an annual nomination and election process, open to all active ONA members, and by select appointment to meet needs identified the current board. The call for nominees to the 2026-27 Board of Directors will open in July 2025. Learn more about the Board of Directors and subscribe to the ONA Weekly for updates on the next election and other opportunities to get involved with ONA.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
