import 'package:associations_app/presentation/offers_screen/controller/offers_controller.dart';
import 'package:get/get.dart';

import '../../new_events_screen/controller/news_events_controller.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(NewsEventsController());
    Get.put(OffersController());
    // TODO: implement dependencies
  }
}