import 'package:flutter/material.dart';

import '../widgets/fullscreen_background.dart';
import '../widgets/role_card.dart';
import '../widgets/price_ticker.dart';
import '../utils/app_text.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FullscreenBackground(
        imagePath: 'assets/images/farm_sunset.jpg',
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // 🔁 SCROLLING CROP PRICES
                  PriceTicker(),

                  const SizedBox(height: 30),

                  // 🔤 TITLE (MULTILINGUAL)
                  Text(
                    AppText.selectRole,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 🌾 FARMER
                  RoleCard(
                    icon: Icons.agriculture,
                    title: AppText.farmer,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/farmerDashboard',
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // 🏭 FACTORY
                  RoleCard(
                    icon: Icons.factory,
                    title: AppText.factory,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/factoryDashboard',
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
