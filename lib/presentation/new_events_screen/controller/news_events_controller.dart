import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/data/api_client/api_service/api_service.dart';
import '../models/event_type_model.dart';
import '../models/news_and_events_model.dart';

class NewsEventsController extends GetxController {
  late Future<List<NewsAndEventsModel>> futureLatest;
  late Future<List<EventTypeModel>> futureEventType;
  final api = ApiService();
  int nextPage = 1;
  int currentPage = 1;
  RxString selectedChoice = 'All'.obs;
  var newsOrEvents = <NewsAndEventsModel>[].obs;
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();
  RxInt selectedType = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    futureLatest = api.fetchLatest();
    futureEventType = api.fetchEventType();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        if (!isLoading.value && nextPage != 0) {
          fetchNewsOrEvents(selectedType.value, false);
        }
      }
    });
    fetchNewsOrEvents(0, false);
    super.onInit();
  }

  Future<void> fetchNewsOrEvents(int type, bool select) async {
    selectedType.value = type;
    if (isLoading.value) return;
    if (select) {
      // Reset pagination for new type
      currentPage = 1;
      nextPage = 1;
      newsOrEvents.clear();
    }
    if (nextPage == 0) return;
    isLoading.value = true;
    try {
      final response = await api.fetchNewsOrEvents(type, currentPage);
      if (select) {
        newsOrEvents.assignAll(response['list']);
      } else {
        newsOrEvents.addAll(response['list']);
      }
      nextPage = response['nextPage'];
      if (nextPage != 0) currentPage = nextPage;
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }

    isLoading.value = false;
  }
}
