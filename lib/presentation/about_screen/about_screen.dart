import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/about_screen/widgets/about_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller/about_us_controller.dart';

class AboutScreen extends GetView<AboutUsController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ABOUT"),
        backgroundColor: ConstData.secondaryClr,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.futureAboutUs,
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
                  if (!await launchUrl(Uri.parse(url!))) {
                    throw Exception('Could not launch $url');
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
