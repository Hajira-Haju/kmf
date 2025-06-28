import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/data/api_client/api_service/api_service.dart';

class QuickContactController extends GetxController{
  late Future<dynamic> futureQuickContact;
  final api = ApiService();
  @override
  void onInit() {
    futureQuickContact = api.fetchQuickContact();
    // TODO: implement onInit
    super.onInit();
  }
}