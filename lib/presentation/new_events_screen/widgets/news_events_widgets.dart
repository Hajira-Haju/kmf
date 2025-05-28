import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/new_events_screen/controller/news_events_controller.dart';
import 'package:associations_app/presentation/news_inner_screen/news_inner_screen.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../models/news_events_data.dart';

class NewsEventsWidgets {
  static Widget textField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search here...',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: ConstData.secondaryClr,
              child: Icon(CupertinoIcons.arrow_right),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ConstData.secondaryClr),
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      ),
    );
  }

  static Widget latestNewsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Latest Updates',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 210,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: NewsEventsData.latestNews.length,
            itemBuilder: (context, index) {
              final data = NewsEventsData.latestNews[index];
              return GestureDetector(
                onTap:
                    () => Get.toNamed(
                      AppRoutes.newsInnerScreen,
                      arguments: {
                        'imgUrl': data.imgUrl,
                        'head': data.title,
                        'content': data.description,
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
                            child: Image.network(
                              data.imgUrl,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      Icon(Icons.error),
                              width: 320,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            data.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '12/02/2025',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
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
  }

  static Widget choiceChip(NewsEventsController controller) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            NewsEventsData.choiceData.map((choices) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChoiceChip(
                  labelStyle: TextStyle(
                    color:
                        controller.selectedChoice.value == choices
                            ? Colors.white
                            : Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  selectedColor: ConstData.primaryClr,
                  label: Text(choices),
                  selected: controller.selectedChoice.value == choices,
                  onSelected: (value) {
                    if (controller.selectedChoice.value != choices) {
                      controller.selectedChoice.value = choices;
                    }
                  },
                ),
              );
            }).toList(),
      ),
    );
  }

  static Widget newsList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: NewsEventsData.newsList.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final data = NewsEventsData.newsList[index];
        return GestureDetector(
          onTap:
              () => Get.toNamed(
                AppRoutes.newsInnerScreen,
                arguments: {
                  'imgUrl': data.imgUrl,
                  'head': data.title,
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
                    child: Image.network(
                      data.imgUrl,
                      fit: BoxFit.cover,
                      errorBuilder:
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
                          data.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '12/02/2023',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          data.description,
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
  }
}
