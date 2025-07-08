import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/refer_member_screen/controller/refer_member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferMemberScreen extends GetView<ReferMemberController> {
  const ReferMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.secondaryClr,
        title: const Text('Refer a Member'),
        centerTitle: true,
        foregroundColor: Colors.white,

      ),
      body: FutureBuilder(
        future: controller.futureReferFriend,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitFadingCircle(
                color: ConstData.secondaryClr,
                size: 50,
              ),
            );
          } else if (snapshot.hasData) {
            final htmlContent = snapshot.data;
            return SingleChildScrollView(
              child: Html(
                data: htmlContent.replaceAll("<br>", ""),
                onLinkTap: (url, attributes, element) async {
                  bool containsAtLeast8Digits(String input) {
                    final digitMatches = RegExp(r'\d').allMatches(input);
                    return digitMatches.length >= 6;
                  }

                  Uri uri;
                  if (url!.contains('@')) {
                    uri = Uri(scheme: 'mailto', path: url.trim());
                  } else if (url.startsWith('+') ||
                      containsAtLeast8Digits(url)) {
                    uri = Uri(scheme: 'tel', path: url.trim());
                  } else {
                    uri = Uri.parse(url);
                  }
                  if (!await launchUrl(uri)) {
                    throw Exception('Could not launch $url');
                  }
                },

                style: {
                  // Customize the styles if needed
                  "h1": Style(fontSize: FontSize.xxLarge),
                  "p": Style(
                    fontSize: FontSize.medium,
                    margin: Margins.all(6),
                    lineHeight: LineHeight(1.6),
                  ),

                  "li": Style(fontSize: FontSize.medium),
                },
              ),
            );
          } else {
            return Center(child: Text("Something went wrong"));
          }
        },
      ),
      floatingActionButton: FutureBuilder(
        future: controller.futureReferFriend,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton(
              backgroundColor: ConstData.secondaryClr,
              foregroundColor: Colors.white,
              onPressed: () {
                controller.shareReferContent(snapshot.data!);
              },
              child: const Icon(Icons.share),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
