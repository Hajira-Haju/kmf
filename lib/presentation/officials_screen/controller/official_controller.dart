import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/const_datas.dart';
import '../../../core/data/api_client/api_service/api_service.dart';
import '../model/official_data.dart';
import '../model/officials_model.dart';

class OfficialController extends GetxController {
  final apiService = ApiService();
  var isLoading = true.obs;
  var officialsList = <OfficialsModel>[].obs;

  @override
  void onInit() {
    fetchOfficials();
    super.onInit();
  }

  void fetchOfficials() async {
    try {
      isLoading(true);
      officialsList.value = await apiService.fetchOfficialsData();
    } finally {
      isLoading(false);
    }
  }

  Future<void> openDialer(String no) async {
    final uri = Uri(scheme: 'tel', path: no.trim());
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $no');
    }
  }

  void showMemberDialog(BuildContext context, CommitteMembers member) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            title: Text(
              member.memberName ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: member.imagePath ?? '',
                    height: 120.h,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Designation: ${member.designation ?? ''}'),
                const SizedBox(height: 8),
                Text('Phone: ${member.phoneNumber ?? ''}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Close'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ConstData.secondaryClr,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                  openDialer(member.phoneNumber!);
                },
                icon: const Icon(Icons.phone),
                label: const Text('Call'),
              ),
            ],
          ),
    );
  }
}
