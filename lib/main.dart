import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


// FARMER SCREENS
import 'screens/home_screen.dart';
import 'screens/farmer_dashboard_screen.dart';
import 'screens/farmer_add_crop_screen.dart';
import 'screens/farmer_received_offers_screen.dart';
import 'screens/farmer_market_prices_screen.dart';
import 'screens/role_selection_screen.dart';
import 'screens/farmer_ai_assistant_screen.dart';


// FACTORY SCREENS
import 'screens/factory_dashboard_screen.dart';
import 'screens/factory_my_bids_screen.dart';
import 'screens/factory_market_prices_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {

        // HOME
        '/': (context) => const HomeScreen(),

        // ROLE
        '/role': (context) => const RoleSelectionScreen(),

        // FARMER ROUTES
        '/farmerDashboard': (context) =>
            const FarmerDashboardScreen(),

        '/addCrop': (context) =>
            const FarmerAddCropScreen(),

        '/receivedOffers': (context) =>
            const FarmerReceivedOffersScreen(),

        '/marketPrices': (context) =>
            const FarmerMarketPricesScreen(),

        // FACTORY ROUTES
        '/factoryDashboard': (context) =>
            const FactoryDashboardScreen(),

        '/factoryMyBids': (context) =>
            const FactoryMyBidsScreen(),

        '/factoryMarketPrices': (context) =>
            const FactoryMarketPricesScreen(),
            '/farmerAi': (context) => const FarmerAiAssistantScreen(),
   


      },
    );
  }
}
