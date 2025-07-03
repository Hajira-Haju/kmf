import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/refer_member_screen/controller/refer_member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/dom.dart' as dom; // <-- Needed for dom.Element

class ReferMemberScreen extends GetView<ReferMemberController> {
  const ReferMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.secondaryClr,
        title: const Text('REFER'),
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
                onLinkTap: (
                  String? url,
                  Map<String, String> attributes,
                  element,
                ) async {
                  if (!await launchUrl(Uri.parse(url!))) {
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
    );
  }
}
