import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/quick_contact_screen/widget/quick_contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickContactScreen extends StatelessWidget {
  const QuickContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Contact'),
        centerTitle: true,
        backgroundColor: ConstData.secondaryClr,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            QuickContactWidget.contactSection("Membership Support", [
              QuickContactWidget.contactRow(label: "Name", value: "Mr. Lijo"),
              QuickContactWidget.contactRow(
                label: "Mobile",
                value: "+965 66924313",
              ),
              QuickContactWidget.contactRow(
                label: "Email",
                value: "Lijo@kmfkuwait.com",
                isLink: true,
              ),
            ]),
            QuickContactWidget.contactSection("Technical Support", [
              QuickContactWidget.contactRow(
                label: "Name",
                value: "Rohin Kishan",
              ),
              QuickContactWidget.contactRow(
                label: "Mobile",
                value: "+965 55728859",
              ),
              QuickContactWidget.contactRow(
                label: "Email",
                value: "Rohin@technocare.com.kw",
                isLink: true,
              ),
            ]),
            QuickContactWidget.contactSection("General Inquiries", [
              QuickContactWidget.contactRow(label: "Name", value: "Mr. Lijo"),
              QuickContactWidget.contactRow(
                label: "Mobile",
                value: "+965 66924313",
              ),
              QuickContactWidget.contactRow(
                label: "Email",
                value: "Lijo@kmfkuwait.com",
                isLink: true,
              ),
            ]),
            QuickContactWidget.contactSection("Embassy of India, Kuwait", [
              QuickContactWidget.contactRow(
                label: "Phone",
                value: "+965 65806735, 65807695",
              ),
              QuickContactWidget.contactRow(
                label: "Emergency",
                value: "00-965-2-2519532",
              ),
              QuickContactWidget.contactRow(
                label: "Email",
                value: "amb.kuwait@mea.gov.in",
                isLink: true,
              ),
              QuickContactWidget.contactRow(
                label: "Website",
                value: "https://indembkwt.gov.in",
                isLink: true,
              ),
              QuickContactWidget.contactRow(
                label: "Address",
                value:
                    "Diplomatic Enclave, Arabian Gulf Street, P.O. Box 1450, Safat-13015, Kuwait.",
              ),
              QuickContactWidget.contactRow(
                label: "Working Hours",
                value:
                    "8.00 AM to 4.30 PM (Sunday to Thursday)\n(Lunch: 1:00 PM – 1:30 PM)",
              ),
            ]),
            QuickContactWidget.contactSection(
              "Passport/Visa/Consular Services",
              [
                QuickContactWidget.contactRow(
                  label: "Phone",
                  value: "+965 22211228",
                ),
                QuickContactWidget.contactRow(
                  label: "WhatsApp",
                  value: "+965 65506360",
                ),
                QuickContactWidget.contactRow(
                  label: "Email",
                  value: "Info.indkwi@blsinternational.net",
                  isLink: true,
                ),
                QuickContactWidget.contactRow(
                  label: "Website",
                  value: "https://www.blsinternational.com/india/kuwait",
                  isLink: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
