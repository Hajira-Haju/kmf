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
                width: double.infinity,
                child: Image.network(
                  controller.imgUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Icon(Icons.error),
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
                          controller.head,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                         controller.content,
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
