import 'package:flutter/material.dart';

class FullscreenBackground extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const FullscreenBackground({
    super.key,
    required this.child,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),

        Container(
          color: Colors.black.withValues(alpha: 0.4)

        ),

        child,
      ],
    );
  }
}
