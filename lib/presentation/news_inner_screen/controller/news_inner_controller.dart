import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class NewsInnerController extends GetxController {
  final arg = Get.arguments;
  String get imgUrl => arg['imgUrl'];
  String get head => arg['head'];
  String get content => arg['content'];

  void shareContent() {
    final String url = "https://kmfkuwait.com";

    final String fullText = "$url\n\n$head\n\n$content";
    SharePlus.instance.share(ShareParams(text: fullText));
  }
}
