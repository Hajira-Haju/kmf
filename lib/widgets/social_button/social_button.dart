import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool isExpanded;
  const SocialButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    required this.isExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isExpanded ? 160 : 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isExpanded ? color : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isExpanded ? Colors.white : Colors.black,
                size: 26,
              ),
            ),
            SizedBox(width: isExpanded ? 10 : 0),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isExpanded ? 80 : 0, // dynamically animates width
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isExpanded ? 1.0 : 0.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
