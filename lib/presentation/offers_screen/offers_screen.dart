import 'package:associations_app/presentation/bottom_nav_screen/controller/bottom_nav_controller.dart';
import 'package:associations_app/presentation/offers_screen/controller/offers_controller.dart';
import 'package:associations_app/presentation/offers_screen/controller/offers_controller.dart';
import 'package:associations_app/presentation/offers_screen/widgets/offer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../notification_screen/notification_screen.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    return Scaffold(
      body: FutureBuilder(
        future: controller.futureOffer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return OfferWidget.shimmerLoad();
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return SingleChildScrollView(
              child: OfferWidget.offersCategory(data!),
            );
          } else {
            return Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
