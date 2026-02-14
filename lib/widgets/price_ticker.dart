import 'package:flutter/material.dart';

class PriceTicker extends StatelessWidget {
  const PriceTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      color: Colors.green.shade700,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _Item("🍅 Tomato ₹25/kg"),
          _Item("🌶️ Chilli ₹180/kg"),
          _Item("🧅 Onion ₹35/kg"),
          _Item("🥔 Potato ₹22/kg"),
          _Item("🌾 Wheat ₹28/kg"),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text;
  const _Item(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
