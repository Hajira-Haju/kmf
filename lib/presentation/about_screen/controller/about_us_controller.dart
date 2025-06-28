import 'package:get/get.dart';

import '../../../core/data/api_client/api_service/api_service.dart';

class AboutUsController extends GetxController {
  late Future<dynamic> futureAboutUs;
  final api = ApiService();
  @override
  void onInit() {
    futureAboutUs = api.fetchAboutUs();
    // TODO: implement onInit
    super.onInit();
  }
}
