import 'package:get/get.dart';

import '../../../core/data/api_client/api_service/api_service.dart';
import '../models/event_type_model.dart';
import '../models/news_and_events_model.dart';

class NewsEventsController extends GetxController {
  late Future<List<NewsAndEventsModel>> futureLatest;
  late Future<List<EventTypeModel>> futureEventType;
  final api = ApiService();
  RxString selectedChoice = 'All'.obs;
  var newsOrEvents = <NewsAndEventsModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt selectedType = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    futureLatest = api.fetchLatest();
    futureEventType = api.fetchEventType();
    fetchNewsOrEvents(0);
    super.onInit();
  }

  Future<void> fetchNewsOrEvents(int type) async {
    selectedType.value = type;
    isLoading.value = true;
    newsOrEvents.value = await api.fetchNewsOrEvents(type);
    isLoading.value = false;
  }
}
