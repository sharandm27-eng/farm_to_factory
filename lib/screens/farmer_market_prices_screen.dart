import 'package:flutter/material.dart';

class FarmerMarketPricesScreen extends StatelessWidget {
  const FarmerMarketPricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F3),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Market Prices',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [

          Text(
            'Today – Guntur District',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),

          SizedBox(height: 24),

          _PriceCard(
            crop: 'Tomato',
            mandi: '₹20 – ₹28',
            local: '₹22',
            factory: '₹32',
            change: '+14%',
            isPositive: true,
          ),

          SizedBox(height: 20),

          _PriceCard(
            crop: 'Chilli (Guntur S4)',
            mandi: '₹150 – ₹175',
            local: '₹160',
            factory: '₹185',
            change: '+6%',
            isPositive: true,
          ),

          SizedBox(height: 20),

          _PriceCard(
            crop: 'Onion',
            mandi: '₹30 – ₹38',
            local: '₹32',
            factory: '₹28',
            change: '-11%',
            isPositive: false,
          ),

          SizedBox(height: 40),

          Center(
            child: Text(
              '💡 Factory prices are typically 10–15% higher than mandi prices.\nSell directly to get better returns!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  final String crop;
  final String mandi;
  final String local;
  final String factory;
  final String change;
  final bool isPositive;

  const _PriceCard({
    required this.crop,
    required this.mandi,
    required this.local,
    required this.factory,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final trendColor = isPositive ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Crop Title
          Text(
            crop,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          /// Mandi Price
          _priceRow('Mandi Price', mandi),

          const SizedBox(height: 8),

          /// Local Buyer
          _priceRow('Local Buyer', local),

          const SizedBox(height: 12),

          /// Factory Price + Animated Trend
          Row(
            children: [
              const Text(
                'Factory Price:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                factory,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const Spacer(),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Container(
                  key: ValueKey(change),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: trendColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isPositive
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 14,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        change,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value) {
    return Row(
      children: [
        Text(label),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
