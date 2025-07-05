import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void showImageDialog(String src) {
    Get.dialog(
      StatefulBuilder(
        builder:
            (context, setState) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 4,
                child: GestureDetector(
                  onDoubleTap: () => Get.back(),
                  child: CachedNetworkImage(imageUrl: src),
                ),
              ),
            ),
      ),
    );
  }
}
