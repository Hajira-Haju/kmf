import 'package:flutter/material.dart';

class AnimatedTestPage extends StatefulWidget {
  const AnimatedTestPage({super.key});

  @override
  State<AnimatedTestPage> createState() => _AnimatedTestPageState();
}

class _AnimatedTestPageState extends State<AnimatedTestPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isAnimating = false;

  @override
  void initState() {
    super.initState();

    // Initialize the controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Create a tween for scaling
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _toggleAnimation() {
    if (isAnimating) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      isAnimating = !isAnimating;
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Test Page")),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Tap Me",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
