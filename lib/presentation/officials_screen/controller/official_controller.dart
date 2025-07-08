import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/data/api_client/api_service/api_service.dart';
import '../model/official_data.dart';
import '../model/officials_model.dart';

class OfficialController extends GetxController {
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

  Future<void> openDialer(String no) async {
    final uri = Uri(scheme: 'tel', path: no.trim());
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $no');
    }
  }
}
