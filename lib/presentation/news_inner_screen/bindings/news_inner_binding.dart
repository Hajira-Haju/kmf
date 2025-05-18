import 'package:associations_app/presentation/news_inner_screen/controller/news_inner_controller.dart';
import 'package:get/get.dart';

class NewsInnerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NewsInnerController());
    // TODO: implement dependencies
  }
}