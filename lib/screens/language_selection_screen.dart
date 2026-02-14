import 'package:flutter/material.dart';
import '../widgets/fullscreen_background.dart';
import '../widgets/language_card.dart';
import '../widgets/price_ticker.dart';
import '../utils/app_language.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  void _selectLanguage(AppLanguage language) {
    setState(() {
      AppLanguageState.setLanguage(language);
    });

    // ✅ consistent route
    Navigator.pushReplacementNamed(context, '/role');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullscreenBackground(
        imagePath: 'assets/images/farm_sunset.jpg',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              /// 🔁 scrolling crop prices
              const PriceTicker(),

              const SizedBox(height: 40),

              const Text(
                'Select Your Language',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  LanguageCard(
                    title: 'English',
                    subtitle: 'English',
                    selected:
                        AppLanguageState.current == AppLanguage.english,
                    onTap: () => _selectLanguage(AppLanguage.english),
                  ),

                  LanguageCard(
                    title: 'हिंदी',
                    subtitle: 'Hindi',
                    selected:
                        AppLanguageState.current == AppLanguage.hindi,
                    onTap: () => _selectLanguage(AppLanguage.hindi),
                  ),

                  LanguageCard(
                    title: 'తెలుగు',
                    subtitle: 'Telugu',
                    selected:
                        AppLanguageState.current == AppLanguage.telugu,
                    onTap: () => _selectLanguage(AppLanguage.telugu),
                  ),

                  LanguageCard(
                    title: 'ಕನ್ನಡ',
                    subtitle: 'Kannada',
                    selected:
                        AppLanguageState.current == AppLanguage.kannada,
                    onTap: () => _selectLanguage(AppLanguage.kannada),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
