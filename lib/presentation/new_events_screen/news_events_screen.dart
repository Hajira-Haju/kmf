import 'package:associations_app/presentation/new_events_screen/controller/news_events_controller.dart';
import 'package:associations_app/presentation/new_events_screen/widgets/news_events_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../bottom_nav_screen/controller/bottom_nav_controller.dart';
import '../notification_screen/notification_screen.dart';
import 'models/news_events_data.dart';

class NewsEventsScreen extends StatelessWidget {
  const NewsEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsEventsController controller = NewsEventsController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewsEventsWidgets.latestNewsList(),
            NewsEventsWidgets.choiceChip(controller),
            NewsEventsWidgets.newsList(),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
