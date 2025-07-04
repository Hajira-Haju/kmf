import 'package:get/get.dart';

import '../../../core/data/api_client/api_service/api_service.dart';
import '../model/official_model.dart';

class OfficialsController extends GetxController {
  final apiService = ApiService();
  var isLoading = true.obs;
  var officialsList = <OfficialsModel>[].obs;

  @override
  void onInit() {
    fetchOfficials();
    super.onInit();
  }

  void fetchOfficials() async {
    try {
      isLoading(true);
      officialsList.value = await apiService.fetchOfficialsData();
    } finally {
      isLoading(false);
    }
  }
}