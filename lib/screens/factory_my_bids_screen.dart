import 'package:flutter/material.dart';

class FactoryMyBidsScreen extends StatelessWidget {
  const FactoryMyBidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),

      // ───────── APP BAR ─────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Bids',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ───────── BODY ─────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            _BidCard(
              crop: 'Tomato',
              variety: 'Hybrid 102',
              farmer: 'Ramesh Kumar',
              location: 'Guntur, AP',
              quantity: '5,000 kg',
              price: '₹32/kg',
              status: BidStatus.pending,
              timeAgo: '2 hours ago',
            ),

            SizedBox(height: 20),

            _BidCard(
              crop: 'Chilli',
              variety: 'Guntur S4',
              farmer: 'Suresh Reddy',
              location: 'Vijayawada, AP',
              quantity: '2,000 kg',
              price: '₹180/kg',
              status: BidStatus.accepted,
              timeAgo: '1 day ago',
            ),

            SizedBox(height: 20),

            _BidCard(
              crop: 'Onion',
              variety: 'Nashik Red',
              farmer: 'Venkat Rao',
              location: 'Kurnool, AP',
              quantity: '3,000 kg',
              price: '₹38/kg',
              status: BidStatus.rejected,
              timeAgo: '2 days ago',
            ),
          ],
        ),
      ),
    );
  }
}

/* ───────────────────────── BID CARD ───────────────────────── */

enum BidStatus { pending, accepted, rejected }

class _BidCard extends StatelessWidget {
  final String crop;
  final String variety;
  final String farmer;
  final String location;
  final String quantity;
  final String price;
  final BidStatus status;
  final String timeAgo;

  const _BidCard({
    required this.crop,
    required this.variety,
    required this.farmer,
    required this.location,
    required this.quantity,
    required this.price,
    required this.status,
    required this.timeAgo,
  });

  Color get borderColor {
    switch (status) {
      case BidStatus.accepted:
        return Colors.green;
      case BidStatus.rejected:
        return Colors.red;
      case BidStatus.pending:
      
        return Colors.orange;
    }
  }

  Color get chipColor {
    switch (status) {
      case BidStatus.accepted:
        return Colors.green.shade100;
      case BidStatus.rejected:
        return Colors.red.shade100;
      case BidStatus.pending:
    
        return Colors.orange.shade100;
    }
  }

  Color get chipTextColor {
    switch (status) {
      case BidStatus.accepted:
        return Colors.green;
      case BidStatus.rejected:
        return Colors.red;
      case BidStatus.pending:
     
        return Colors.orange;
    }
  }

  String get statusText {
    switch (status) {
      case BidStatus.accepted:
        return 'Accepted';
      case BidStatus.rejected:
        return 'Rejected';
      case BidStatus.pending:
      
        return 'Pending';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ─── TOP ROW ───
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CropIcon(crop: crop),
              const SizedBox(width: 12),

              Expanded(
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
                    Text(variety),
                    const SizedBox(height: 6),
                    Text('$farmer • $location'),
                    Text(quantity),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Chip(
                    label: Text(
                      statusText,
                      style: TextStyle(color: chipTextColor),
                    ),
                    backgroundColor: chipColor,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    timeAgo,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// ─── PRICE ───
          Text(
            price,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          if (status == BidStatus.accepted) ...[
            const SizedBox(height: 16),

            /// ─── CONTACT BUTTON ───
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text('Contact Farmer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/* ───────────────────────── CROP ICON ───────────────────────── */

class _CropIcon extends StatelessWidget {
  final String crop;

  const _CropIcon({required this.crop});

  IconData get icon {
    switch (crop.toLowerCase()) {
      case 'tomato':
        return Icons.apple;
      case 'chilli':
        return Icons.local_fire_department;
      case 'onion':
        return Icons.circle;
      default:
        return Icons.grass;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 32, color: Colors.green),
    );
  }
}
