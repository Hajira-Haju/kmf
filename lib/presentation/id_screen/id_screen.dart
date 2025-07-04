import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/data/api_client/api_list/api_list.dart';
import 'package:associations_app/generated/assets.dart';
import 'package:associations_app/presentation/id_screen/controller/id_controller.dart';
import 'package:associations_app/presentation/id_screen/widget/id_widgets.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../res/assets_res.dart';

class IdScreen extends StatefulWidget {
  const IdScreen({super.key});

  @override
  State<IdScreen> createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  @override
  Widget build(BuildContext context) {
    IdController controller = Get.put(IdController());
    return PopScope(
      canPop: controller.canPop,
      onPopInvokedWithResult:
          (didPop, result) =>
              controller.canPop
                  ? null
                  : Get.offAllNamed(AppRoutes.bottomNavScreen),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap:
                () =>
                    controller.canPop
                        ? Get.back()
                        : Get.offAllNamed(AppRoutes.bottomNavScreen),
            child: Icon(Icons.close, color: ConstData.secondaryClr),
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(AssetsRes.THE_ASSOCIATES_LOGO, width: 30),
              ),
              SizedBox(width: 5),
              Text('MY DIGITAL ID'),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    controller.fetchCivilDataLive();
                  });
                },
                child: Icon(Icons.refresh, color: ConstData.secondaryClr),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: controller.futureCivilId,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return IdWidgets.shimmer();
              } else if (snapshot.hasData) {
                final civilIdData = snapshot.data;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: ConstData.secondaryClr,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ApiList.baseUrl}${civilIdData!.imagepath!}',
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => Shimmer.fromColors(
                                  baseColor: ConstData.shimmerClrBase(context),
                                  highlightColor: ConstData.shimmerClrHighLight(
                                    context,
                                  ),
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) => const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                    IdWidgets.idDetails(controller, civilIdData),
                    SizedBox(height: 40),
                  ],
                );
              } else {
                return Center(child: Text('Something went wrong'));
              }
            },
          ),
        ),
      ),
    );
  }
}
