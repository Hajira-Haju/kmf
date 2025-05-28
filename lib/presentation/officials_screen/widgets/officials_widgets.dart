import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/official_data.dart';

class OfficialsWidgets {
  static Widget gridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: OfficialData.officialsData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final data = OfficialData.officialsData[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 100.h,
                    child: Image.network(
                      data.img,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                data.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                data.pos,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  backgroundColor: ConstData.secondaryClr,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                ),
                onPressed: () {
                  // You can use url_launcher to dial
                },
                icon: const Icon(CupertinoIcons.phone, size: 16),
                label: Text(data.ph, style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        );
      },
    );
  }
}
