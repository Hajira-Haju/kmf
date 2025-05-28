import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/const_datas.dart';

class QuickContactWidget {
  static Widget contactSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: ConstData.secondaryClr,
                ),
              ),
              const Divider(thickness: 1),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  static Widget contactRow({
    required String label,
    required String value,
    bool isLink = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: GestureDetector(
              onTap:
                  isLink
                      ? () async {
                        final Uri uri = Uri.parse(
                          value.startsWith('http') ? value : 'mailto:$value',
                        );
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }
                      : null,
              child: Text(
                value,
                style: TextStyle(
                  color: isLink ? Colors.blue : Colors.black87,
                  decoration:
                      isLink ? TextDecoration.underline : TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
