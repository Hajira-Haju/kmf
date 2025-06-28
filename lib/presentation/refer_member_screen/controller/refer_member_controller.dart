import 'package:get/get.dart';

import '../../../core/data/api_client/api_service/api_service.dart';

class ReferMemberController extends GetxController {
  late Future<dynamic> futureReferFriend;
  final api = ApiService();
  @override
  void onInit() {
    futureReferFriend = api.fetchReferAFriend();
    // TODO: implement onInit
    super.onInit();
  }
}
