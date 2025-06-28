import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/new_events_screen/controller/news_events_controller.dart';
import 'package:associations_app/presentation/news_inner_screen/news_inner_screen.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../models/news_events_data.dart';

class NewsEventsWidgets {
  static Widget latestNewsList(
    NewsEventsController controller,
    BuildContext widgetContext,
  ) {
    return FutureBuilder(
      future: controller.futureLatest,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: ConstData.shimmerClrBase(widgetContext),
            highlightColor: ConstData.shimmerClrHighLight(widgetContext),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('Latest Updates', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 320,
                        child: Card(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 130, width: double.infinity),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                child: Text('Latest Updates', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data!.length >= 5 ? 5 : data.length,
                  itemBuilder: (context, index) {
                    final latestNews = data[index];
                    return GestureDetector(
                      onTap:
                          () => Get.toNamed(
                            AppRoutes.newsInnerScreen,
                            arguments: {
                              'imgUrl': latestNews.imagePath,
                              'head': latestNews.heading,
                              'content': latestNews.description,
                            },
                          ),
                      child: SizedBox(
                        width: 320,
                        child: Card(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: latestNews.imagePath!,
                                    errorWidget:
                                        (context, error, stackTrace) =>
                                            Icon(Icons.error),
                                    placeholder:
                                        (context, url) => Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            color: Colors.grey,
                                            width: double.infinity,
                                          ),
                                        ),
                                    width: 320,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  top: 8,
                                ),
                                child: Text(
                                  latestNews.heading!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  latestNews.date!,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return SizedBox(
            height: 220,
            child: Center(child: Text('Something went wrong')),
          );
        }
      },
    );
  }

  static Widget choiceChip(
    NewsEventsController controller,
    BuildContext context,
  ) {
    return FutureBuilder(
      future: controller.futureEventType,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: ConstData.shimmerClrBase(context),
            highlightColor: ConstData.shimmerClrHighLight(context),
            child: Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    label: SizedBox(width: 30),
                    selected: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data;
          return Obx(() {
            final isDark = Theme.of(context).brightness == Brightness.dark;
            return Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                      data!.map((choices) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChoiceChip(
                            labelStyle: TextStyle(
                              color:
                                  isDark
                                      ? Colors.white
                                      : controller.selectedChoice.value ==
                                          choices.typeName
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            selectedColor: ConstData.primaryClr,
                            label: Text(choices.typeName!),
                            selected:
                                controller.selectedChoice.value ==
                                choices.typeName,
                            onSelected: (value) async {
                              if (controller.selectedChoice.value !=
                                  choices.typeName) {
                                controller.selectedChoice.value =
                                    choices.typeName!;
                                controller.fetchNewsOrEvents(choices.id!, true);
                              }
                            },
                          ),
                        );
                      }).toList(),
                ),
              ),
            );
          });
        } else {
          return SizedBox(height: 70);
        }
      },
    );
  }

  static Widget newsList(
    NewsEventsController controller,
    BuildContext context,
  ) {
    return Obx(() {
      if (controller.newsOrEvents.isEmpty && controller.isLoading.value) {
        return Shimmer.fromColors(
          baseColor: ConstData.shimmerClrBase(context),
          highlightColor: ConstData.shimmerClrHighLight(context),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8),
                child: Row(children: [SizedBox(width: 150, height: 100)]),
              );
            },
          ),
        );
      } else if (controller.newsOrEvents.isNotEmpty) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:
              controller.selectedType.value == 0
                  ? controller.newsOrEvents.length > 5
                      ? controller.newsOrEvents.length - 5
                      : controller.newsOrEvents.length
                  : controller.newsOrEvents.length +
                      (controller.isLoading.value ? 1 : 0),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data =
                controller.selectedType.value == 0
                    ? controller.newsOrEvents.length > 5
                        ? controller.newsOrEvents[index + 5]
                        : controller.newsOrEvents[index]
                    : controller.newsOrEvents[index];
            return GestureDetector(
              onTap:
                  () => Get.toNamed(
                    AppRoutes.newsInnerScreen,
                    arguments: {
                      'imgUrl': data.imagePath,
                      'head': data.heading,
                      'content': data.description,
                    },
                  ),
              child: Card(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: data.imagePath!,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
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
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.heading!,
                              style: TextStyle(fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              data.date!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              data.description!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else if (controller.isLoading.value == false &&
          controller.newsOrEvents.isEmpty) {
        return Column(children: [SizedBox(height: 120), Text('No Data Found')]);
      } else {
        return Column(
          children: [SizedBox(height: 120), Text('Something went wrong')],
        );
      }
    });
  }
}
