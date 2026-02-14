import 'package:flutter/material.dart';

class SunriseBackground extends StatefulWidget {
  final Widget child;
  const SunriseBackground({super.key, required this.child});

  @override
  State<SunriseBackground> createState() => _SunriseBackgroundState();
}

class _SunriseBackgroundState extends State<SunriseBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _sunRise;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);
    _sunRise = Tween<double>(begin: 1.2, end: 0.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/sunrise_field.jpg',
            fit: BoxFit.cover,
          ),
        ),

        AnimatedBuilder(
          animation: _sunRise,
          builder: (_, _) => Positioned(
            top: MediaQuery.of(context).size.height * _sunRise.value,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orangeAccent,
              ),
            ),
          ),
        ),

        FadeTransition(
          opacity: _fade,
          child: widget.child,
        ),
      ],
    );
  }
}
