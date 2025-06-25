import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferMemberScreen extends StatelessWidget {
  const ReferMemberScreen({super.key});

  final String referralLink = 'http://portal.kmfkuwait.com/NewMember';

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.secondaryClr,
        title: const Text('REFER'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Help us grow the KMF community by inviting your friends and colleagues to become members!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('💡 ', style: TextStyle(fontSize: 20)),
                Expanded(
                  child: Text(
                    'Know someone who should be a part of KMF? Share the link below and encourage them to register for membership.',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('📲 ', style: TextStyle(fontSize: 20)),
                Expanded(
                  child: Text(
                    'Membership Registration Link:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade100,
                border: Border.all(color: ConstData.secondaryClr, width: 1.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      referralLink,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.copy,
                      size: 20,
                      color: ConstData.secondaryClr,
                    ),
                    onPressed: () {
                      Clipboard.setData(
                        const ClipboardData(
                          text: 'http://portal.kmfkuwait.com/NewMember',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Link copied to clipboard!'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('✅ ', style: TextStyle(fontSize: 20)),
                Expanded(
                  child: Text(
                    'It only takes a minute to refer – and it makes a big difference!',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ConstData.secondaryClr,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: referralLink));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Link copied to clipboard!')),
                  );
                },
                icon: const Icon(Icons.share),
                label: const Text('Copy & Share Link'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
