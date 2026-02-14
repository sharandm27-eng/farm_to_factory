import 'package:flutter/material.dart';

class FarmerReceivedOffersScreen extends StatelessWidget {
  const FarmerReceivedOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      appBar: AppBar(
        title: const Text('Received Offers'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            _OfferCard(
              crop: 'Tomato',
              buyer: 'ABC Factory',
              price: '₹30/kg',
              quantity: '5,000 kg',
            ),
            SizedBox(height: 16),
            _OfferCard(
              crop: 'Chilli',
              buyer: 'Spice Export Ltd',
              price: '₹175/kg',
              quantity: '2,000 kg',
            ),
          ],
        ),
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final String crop;
  final String buyer;
  final String price;
  final String quantity;

  const _OfferCard({
    required this.crop,
    required this.buyer,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            crop,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Buyer: $buyer'),
          Text('Quantity: $quantity'),
          const SizedBox(height: 10),
          Text(
            price,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Accept'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Reject'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
