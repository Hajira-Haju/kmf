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
              backgroundColor: Colors.orange,
              child: Icon(CupertinoIcons.arrow_right),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange.shade700),
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
            'Latest News',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap:
                    () => Get.toNamed(
                      AppRoutes.newsInnerScreen,
                      arguments: {
                        'imgUrl':
                            'https://media.istockphoto.com/id/479842074/photo/empty-road-at-building-exterior.jpg?s=612x612&w=0&k=20&c=SbyfZGN0i2O_QPLCdBcu9vhuzbQvTz4bGEn-lIzrN0E=',
                        'head': '',
                        'content': '',
                      },
                    ),
                child: SizedBox(
                  width: 320,
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            child: Image.network(
                              'https://media.istockphoto.com/id/479842074/photo/empty-road-at-building-exterior.jpg?s=612x612&w=0&k=20&c=SbyfZGN0i2O_QPLCdBcu9vhuzbQvTz4bGEn-lIzrN0E=',
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Crystal lights of the tune of the light might replace batteries..',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
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
                  selectedColor: Colors.orange,
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
      itemCount: 4,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap:
              () => Get.toNamed(
                AppRoutes.newsInnerScreen,
                arguments: {
                  'imgUrl':
                      'https://www.knowledgetrain.co.uk/training-courses/programmes-1903x1087-1.jpg',
                  'head': '',
                  'content': '',
                },
              ),
          child: Card(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                    ),
                    child: Image.network(
                      'https://www.knowledgetrain.co.uk/training-courses/programmes-1903x1087-1.jpg',
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Icon(Icons.error),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Corporate Summit',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "This year's corporate summit calls for various agenda, especially the launching of multi tenant call...",
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
