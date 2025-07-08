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
    final plainText =
        htmlContent
            // Replace structural tags with newlines before stripping
            .replaceAll(
              RegExp(r'<(p|div|h[1-6])[^>]*>', caseSensitive: false),
              '\n',
            )
            .replaceAll(
              RegExp(r'</(p|div|h[1-6])>', caseSensitive: false),
              '\n',
            )
            .replaceAll(
              RegExp(r'<br\s*/?>', caseSensitive: false),
              '\n',
            ) // <br> to newline
            .replaceAll(
              RegExp(r'<[^>]*>'),
              '',
            ) // remove all remaining HTML tags
            .replaceAll('&nbsp;', ' ')
            .replaceAll('\r', '')
            .replaceAll(
              RegExp(r'\n+'),
              '\n',
            ) // collapse multiple newlines into one
            .trim();
    SharePlus.instance.share(ShareParams(text: plainText));
  }
}
