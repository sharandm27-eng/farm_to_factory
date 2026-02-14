import 'package:flutter/material.dart';

class FactoryDashboardScreen extends StatelessWidget {
  const FactoryDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F3),

      /// ───────────────── APP BAR ─────────────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.agriculture, color: Colors.green),
            SizedBox(width: 8),
            Text(
              'KisanSetu',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.language, color: Colors.black54),
          ),
        ],
      ),

      /// ───────────────── BODY ─────────────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ───────── TOP NAVIGATION ─────────
            Row(
              children: [
                _TopTab(
                  title: 'Factory Dashboard',
                  selected: true,
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                _TopTab(
                  title: 'My Bids',
                  onTap: () {
                    Navigator.pushNamed(context, '/factoryMyBids');
                  },
                ),
                const SizedBox(width: 12),
                _TopTab(
                  title: 'Market Prices',
                  onTap: () {
                    Navigator.pushNamed(context, '/factoryMarketPrices');
                  },
                ),
              ],
            ),

            const SizedBox(height: 28),

            /// ───────── STATS CARDS ─────────
            Row(
              children: const [
                _InfoCard(
                  icon: Icons.gavel,
                  title: 'Active Bids',
                  value: '5',
                  backgroundColor: Color(0xFFFFF3E0),
                  iconColor: Colors.orange,
                ),
                SizedBox(width: 16),
                _InfoCard(
                  icon: Icons.people,
                  title: 'Partner Farmers',
                  value: '8',
                  backgroundColor: Color(0xFFE8F5E9),
                  iconColor: Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 28),

            /// ───────── ACTION CARDS ─────────
            Row(
              children: [
                Expanded(
                  child: _ActionCard(
                    icon: Icons.gavel,
                    title: 'My Bids',
                    color: Colors.green,
                    badge: '5',
                    onTap: () {
                      Navigator.pushNamed(context, '/factoryMyBids');
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
child: _ActionCard(
  icon: Icons.analytics,
  title: 'Analytics',
  color: Colors.orange,
  onTap: () {
    Navigator.pushNamed(context, '/factoryMarketPrices');
  },
),
  
                ),
              ],
            ),

            const SizedBox(height: 32),

            /// ───────── SEARCH FIELD ─────────
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Crops',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// ───────── FILTER CHIPS ─────────
            Wrap(
              spacing: 10,
              children: const [
                _FilterChip(label: 'All', selected: true),
                _FilterChip(label: 'Tomato'),
                _FilterChip(label: 'Chilli'),
                _FilterChip(label: 'Onion'),
                _FilterChip(label: 'Potato'),
              ],
            ),

            const SizedBox(height: 28),

            /// ───────── AVAILABLE CROPS ─────────
            const Text(
              'Available Crops',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const _CropCard(
              crop: 'Tomato',
              variety: 'Hybrid 102',
              quantity: '5,000 kg',
              date: '2026-02-15',
              location: 'Guntur, AP',
              farmer: 'Ramesh Kumar',
              price: '₹12/kg',
            ),

            const SizedBox(height: 20),

            const _CropCard(
              crop: 'Chilli',
              variety: 'Guntur S4',
              quantity: '2,000 kg',
              date: '2026-02-20',
              location: 'Vijayawada, AP',
              farmer: 'Suresh Reddy',
              price: '₹85/kg',
            ),

            const SizedBox(height: 20),

            const _CropCard(
              crop: 'Onion',
              variety: 'Nashik Red',
              quantity: '8,000 kg',
              date: '2026-02-25',
              location: 'Kurnool, AP',
              farmer: 'Venkat Rao',
              price: '₹22/kg',
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////// COMPONENTS //////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class _TopTab extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _TopTab({
    required this.title,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color backgroundColor;
  final Color iconColor;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withValues(alpha: 0.15),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String? badge;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.color,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 36, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (badge != null)
              Positioned(
                right: 16,
                top: 16,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Text(
                    badge!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: selected ? Colors.green : Colors.white,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black,
      ),
      shape: const StadiumBorder(
        side: BorderSide(color: Colors.green),
      ),
    );
  }
}

class _CropCard extends StatelessWidget {
  final String crop, variety, quantity, date, location, farmer, price;

  const _CropCard({
    required this.crop,
    required this.variety,
    required this.quantity,
    required this.date,
    required this.location,
    required this.farmer,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withValues(alpha: 0.4)),
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
          Text(variety),
          const SizedBox(height: 8),
          Text('$quantity • $date • $location'),
          Text('Farmer: $farmer'),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('Place Bid'),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text('Contact Farmer'),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
