import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static Widget offersCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Latest Offers for you',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  'https://media.istockphoto.com/id/1018337470/vector/vector-simple-style-sign-modern-store-with-white-beveled-font.jpg?s=612x612&w=0&k=20&c=rK2eMdKeAm_FpigWWnMFnPGesNzFgFhqppTi-rB6bCs=',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
