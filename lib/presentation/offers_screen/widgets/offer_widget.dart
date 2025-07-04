import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/offers_screen/model/offer_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../routes/app_routes/app_routes.dart';
import '../controller/offers_controller.dart';

class OfferWidget {
  static Widget mainHead() {
    return Container(
      width: double.infinity,
      height: 250,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(3, 3),
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage(
            'https://media.istockphoto.com/id/1166716628/photo/girl-with-megaphone-jumping-and-shouting.jpg?s=612x612&w=0&k=20&c=cRRLUolleERNFlXH0os1ptNihRvckJ_6wqlKB7Az1Ak=',
          ),
          fit: BoxFit.cover,
        ),
        // border: Border.all(color: Colors.black38),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 20, color: Colors.black),
          children: const [
            TextSpan(text: 'Winter Season\n'),
            TextSpan(
              text: 'SALE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }

  static Widget secondaryOff() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(3, 3),
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage(
            'https://media.istockphoto.com/id/1180451018/photo/asian-woman-announcing-on-magaphone.jpg?s=612x612&w=0&k=20&c=glxyRPv6fnfxTuAy1xjCKnGPKY4Ts1Gr2WjlBlYEVAI=',
          ),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        // border: Border.all(color: Colors.black38),
      ),
      width: double.infinity,
      height: 200,
    );
  }

  static Widget offersCategory(List<OfferModel> data) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exclusive offers available',
                  style: const TextStyle(fontSize: 20),
                ),
                Text('only for KMF members.'),
              ],
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: data.length,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final offer = data[index];
              return GestureDetector(
                onTap:
                    () => Get.toNamed(
                      AppRoutes.newsInnerScreen,
                      arguments: {
                        'imgUrl': offer.imagePath,
                        'head': offer.offerHeader,
                        'content': offer.offerDescription,
                      },
                    ),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            imageUrl: offer.imagePath!,
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => Shimmer.fromColors(
                                  baseColor: ConstData.shimmerClrBase(
                                    Get.context!,
                                  ),
                                  highlightColor: ConstData.shimmerClrHighLight(
                                    Get.context!,
                                  ),
                                  child: Container(
                                    color: Colors.grey,
                                    width: double.infinity,
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.offerHeader!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            // Text(
                            //   offer.offerDate!,
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                            Text(
                              offer.offerDescription!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  static Widget shimmerLoad() {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: ConstData.shimmerClrBase(Get.context!),
        highlightColor: ConstData.shimmerClrHighLight(Get.context!),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          padding: EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 130,
          ),
          itemBuilder: (context, index) {
            return Card(color: Colors.white, margin: EdgeInsets.all(8));
          },
        ),
      ),
    );
  }
}
