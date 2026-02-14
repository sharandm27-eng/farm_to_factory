import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🌄 Background Image
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/farm_sunset.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 🌈 Gradient overlay
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.25),
                Colors.green.withValues(alpha: 0.4)
              ],
            ),
          ),
        ),

        child,
      ],
    );
  }
}
