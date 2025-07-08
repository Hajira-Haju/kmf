import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/news_inner_screen/controller/news_inner_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class NewsInnerScreen extends GetView<NewsInnerController> {
  const NewsInnerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 250.h,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => controller.showImageDialog(controller.imgUrl),
                  child: CachedNetworkImage(
                    imageUrl: controller.imgUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Shimmer.fromColors(
                          baseColor: ConstData.shimmerClrBase(context),
                          highlightColor: ConstData.shimmerClrHighLight(
                            context,
                          ),
                          child: Container(
                            color: Colors.grey,
                            width: double.infinity,
                          ),
                        ),
                    errorWidget:
                        (context, error, stackTrace) => Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withValues(alpha: .7),
                    foregroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                InkWell(
                  onTap: () => controller.shareContent(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withValues(alpha: .7),
                    foregroundColor: Colors.white,
                    child: Icon(Icons.share),
                  ),
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
                color: isDark ? Colors.black : Colors.white,
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
                        child: Text(controller.content),
                      ),
                      SizedBox(height: 20),
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
