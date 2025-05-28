import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/about_screen/widgets/about_widgets.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo or top image (optional)
            Center(
              child: Image.asset(
                'assets/the-associates_logo.png',
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Center(
              child: Text(
                "KMF Kuwait Association",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ConstData.secondaryClr,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),

            // Main content
            AboutWidgets.contentText(
              "KMF Kuwait Association is a vibrant and dedicated organization representing the Malayali medical workforce in Kuwait. Formed with the vision of uniting healthcare professionals from Kerala working across various medical sectors in Kuwait, KMF serves as a strong support system and a platform for social, cultural, and professional growth.\n",
            ),
            AboutWidgets.contentText(
              "With a rapidly growing membership of over 5,000 individuals, KMF stands as one of the largest and most active expatriate associations in the region. Our members include nurses, paramedical staff, technicians, and other non-doctor medical personnel who play a crucial role in Kuwait's healthcare system.\n",
            ),
            AboutWidgets.contentText(
              "Registered under the Indian Embassy of Kuwait (Reg. No. INDEMB/KWT/ASSN/403), KMF functions lawfully and transparently, upholding the values of unity, service, and community welfare. We are committed to fostering a sense of belonging among our members while promoting their rights, wellbeing, and career development.\n",
            ),
            AboutWidgets.contentText(
              "Beyond professional support, KMF is deeply involved in social initiatives, charity work, and community events. From organizing blood donation drives and health awareness campaigns to cultural celebrations and educational programs, KMF continues to make a meaningful impact both within and beyond the medical community.\n",
            ),
            AboutWidgets.contentText(
              "KMF Kuwait Association is more than just a group, it's a family that celebrates the spirit of Kerala, upholds the dignity of healthcare professionals, and strengthens the bond among Malayalis working in Kuwait’s medical field.",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
