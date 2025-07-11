import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: PageController(initialPage: pageIndex), // PageController
      count: 3,
      effect: SlideEffect(
        spacing: 8.0,
        radius: 4.0,
        dotWidth: 24.0,
        dotHeight: 8.0,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.5,
        dotColor: Colors.grey,
        activeDotColor: Color(0xFF0D1917),
      ), // your preferred effect
    );
  }
}
