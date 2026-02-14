import 'package:flutter/material.dart';
import '../widgets/big_icon_button.dart';






class FarmerDashboardScreen extends StatefulWidget {
  const FarmerDashboardScreen({super.key});

  @override
  State<FarmerDashboardScreen> createState() =>
      _FarmerDashboardScreenState();
}

class _FarmerDashboardScreenState extends State<FarmerDashboardScreen> {
  int selectedTab = 0;

  final List<String> tabs = [
    'Farmer Dashboard',
    'Add New Crop',
    'Received Offers',
    'Market Prices',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),

      // ───────── APP BAR ─────────
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Farm to Factory',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),

      // ───────── BODY ─────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ─── TOP MENU ───
            _TopMenu(
              tabs: tabs,
              selectedIndex: selectedTab,
              onChanged: (i) {
                setState(() => selectedTab = i);
              },
            ),

            const SizedBox(height: 24),

            /// ─── AI ASSISTANT ───
            const _AiAssistantCard(),

            const SizedBox(height: 24),

            /// ─── STATS ───
            Row(
              children: const [
                _StatCard(
                  title: 'Total Listings',
                  value: '3',
                  subtitle: '2 active',
                  color: Colors.green,
                  icon: Icons.inventory_2,
                ),
                SizedBox(width: 12),
                _StatCard(
                  title: 'Best Offer',
                  value: '₹18/kg',
                  subtitle: 'Chilli',
                  color: Colors.lightGreen,
                  icon: Icons.trending_up,
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                _StatCard(
                  title: 'Total Earnings',
                  value: '₹245K',
                  subtitle: 'This Month',
                  color: Colors.orange,
                  icon: Icons.currency_rupee,
                ),
                SizedBox(width: 12),
                _StatCard(
                  title: 'Active Buyers',
                  value: '12',
                  subtitle: 'In your area',
                  color: Colors.amber,
                  icon: Icons.people,
                ),
              ],
            ),

            const SizedBox(height: 28),

            /// ─── ACTION BUTTONS ───
            Row(
              children: [
                BigIconButton(
                  icon: Icons.agriculture,
                  title: 'Sell Crop',
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pushNamed(context, '/addCrop');
                  },
                ),
                const SizedBox(width: 16),
     BigIconButton(
  icon: Icons.currency_rupee,
  title: 'Check Prices',
  color: Colors.orange,
  onPressed: () {
    Navigator.pushNamed(context, '/marketPrices');

  },
),

              ],
            ),

            const SizedBox(height: 32),

            /// ─── SMART TIPS ───
            const _SmartTips(),

            const SizedBox(height: 32),

            /// ─── MY LISTINGS ───
            const Text(
              'My Listings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            _ListingCard(
              crop: 'Tomato',
              variety: 'Hybrid 102',
              quantity: '5,000 kg',
              date: '2026-02-15',
              location: 'Guntur, AP',
              status: 'Offers Received',
              statusColor: Colors.green,
            ),

            const SizedBox(height: 16),

            _ListingCard(
              crop: 'Chilli',
              variety: 'Guntur S4',
              quantity: '2,000 kg',
              date: '2026-02-20',
              location: 'Guntur, AP',
              status: 'Negotiating',
              statusColor: Colors.orange,
            ),

            const SizedBox(height: 16),

            _ListingCard(
              crop: 'Onion',
              variety: 'Nashik Red',
              quantity: '3,000 kg',
              date: '2026-02-25',
              location: 'Guntur, AP',
              status: 'Sold',
              statusColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

/* ───────────────────────── TOP MENU ───────────────────────── */

class _TopMenu extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _TopMenu({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (i) {
        final selected = i == selectedIndex;
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
              if (tabs[i] == 'Add New Crop') {
                Navigator.pushNamed(context, '/addCrop');
                return;
              }
              if (tabs[i] == 'Received Offers') {
                Navigator.pushNamed(context, '/receivedOffers');
                return;
              }
              if (tabs[i] == 'Market Prices') {
                Navigator.pushNamed(context, '/marketPrices');
                return;
              }
              onChanged(i);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: selected ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green),
              ),
              child: Text(
                tabs[i],
                style: TextStyle(
                  color: selected ? Colors.white : Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

/* ───────────────────────── AI ASSISTANT ───────────────────────── */

class _AiAssistantCard extends StatelessWidget {
  const _AiAssistantCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/farmerAi');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: const [
            Icon(Icons.lightbulb, color: Colors.green),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smart Sowing (AI)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Get AI recommendations for next season',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}


/* ───────────────────────── STAT CARD ───────────────────────── */

class _StatCard extends StatelessWidget {
  final String title, value, subtitle;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const Spacer(),
            Text(value,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color)),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}

/* ───────────────────────── SMART TIPS ───────────────────────── */

class _SmartTips extends StatelessWidget {
  const _SmartTips();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Smart Tips',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        _Tip(text: 'High demand for Chilli in Guntur'),
        _Tip(text: 'Tomato prices peak in Feb–March'),
        _Tip(text: 'Sort by size to get better prices'),
      ],
    );
  }
}

class _Tip extends StatelessWidget {
  final String text;
  const _Tip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text),
    );
  }
}

/* ───────────────────────── LISTING CARD ───────────────────────── */

class _ListingCard extends StatelessWidget {
  final String crop, variety, quantity, date, location, status;
  final Color statusColor;

  const _ListingCard({
    required this.crop,
    required this.variety,
    required this.quantity,
    required this.date,
    required this.location,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(crop,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(variety),
          const SizedBox(height: 8),
          Text('$quantity · $date · $location'),
          const SizedBox(height: 8),
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
