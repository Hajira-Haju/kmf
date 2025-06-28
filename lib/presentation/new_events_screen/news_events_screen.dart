import 'package:associations_app/presentation/new_events_screen/controller/news_events_controller.dart';
import 'package:associations_app/presentation/new_events_screen/widgets/news_events_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../bottom_nav_screen/controller/bottom_nav_controller.dart';
import '../notification_screen/notification_screen.dart';
import 'models/news_events_data.dart';

class NewsEventsScreen extends GetView<NewsEventsController> {
  const NewsEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(controller: controller.scrollController,
        child: Column(
          children: [
            NewsEventsWidgets.latestNewsList(controller, context),
            NewsEventsWidgets.choiceChip(controller, context),
            NewsEventsWidgets.newsList(controller, context),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
