import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramButton extends StatefulWidget {
  @override
  _InstagramButtonState createState() => _InstagramButtonState();
}

class _InstagramButtonState extends State<InstagramButton> {
  bool isFbExpanded = false;
  bool isInstaExpanded = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _handleFbTap() {
    if (!isFbExpanded) {
      setState(() {
        isFbExpanded = true;
        isInstaExpanded = false;
      });
    } else {
      _launchUrl('https://www.facebook.com/yourprofile');
    }
  }

  void _handleInstaTap() {
    if (!isInstaExpanded) {
      setState(() {
        isInstaExpanded = true;
        isFbExpanded = false;
      });
    } else {
      _launchUrl('https://www.instagram.com/yourprofile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Facebook button with AnimatedCrossFade
            GestureDetector(
              onTap: _handleFbTap,
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 400),
                crossFadeState:
                    isFbExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                firstChild: Image.asset('assets/facebook.png', width: 40),
                secondChild: Image.asset('assets/fb_logo.png', width: 160),
              ),
            ),

            // Instagram button with AnimatedCrossFade
            GestureDetector(
              onTap: _handleInstaTap,
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 400),
                crossFadeState:
                    isInstaExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                firstChild: Image.asset('assets/instagram.png', width: 40),
                secondChild: Image.asset('assets/insta_logo.png', width: 160),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
