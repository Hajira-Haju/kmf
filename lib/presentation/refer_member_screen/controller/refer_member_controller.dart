import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

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
  void shareReferContent(String htmlContent) {
    // strip <br> and optionally remove all html tags for cleaner share text
    final plainText = htmlContent
        .replaceAll(RegExp(r'<[^>]*>'), '') // removes all html tags
        .replaceAll('&nbsp;', ' ')
        .replaceAll('\n', '')
        .trim();

    Share.share(plainText);
  }
}

