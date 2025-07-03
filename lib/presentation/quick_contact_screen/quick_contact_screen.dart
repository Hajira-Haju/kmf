import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/quick_contact_screen/widget/quick_contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller/quick_contact_controller.dart';

class QuickContactScreen extends GetView<QuickContactController> {
  const QuickContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Contact'),
        centerTitle: true,
        backgroundColor: ConstData.secondaryClr,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: controller.futureQuickContact,
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
                onLinkTap: (url, attributes, element) async {
                  if (url != null && await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    // Optionally show an error or fallback
                    print("Could not launch $url");
                  }
                },
                data: htmlContent.replaceAll("<br>", ""),
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
