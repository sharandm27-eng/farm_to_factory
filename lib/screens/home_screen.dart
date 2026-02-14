import 'package:flutter/material.dart';
import '../utils/app_text.dart';
import '../utils/app_language.dart';
import '../widgets/fullscreen_background.dart';
import 'otp_login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void continueApp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const OtpLoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullscreenBackground(
        imagePath: 'assets/images/farm_sunset.jpg',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60),

                  // 🌾 APP NAME
                  Text(
                    AppText.appName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    AppText.appTagline,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 🌐 SELECT LANGUAGE
                  Text(
                    AppText.selectLanguage,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 🌐 SMALL LANGUAGE OPTIONS
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _languageChip('English', AppLanguage.english),
                      _languageChip('हिंदी', AppLanguage.hindi),
                      _languageChip('తెలుగు', AppLanguage.telugu),
                      _languageChip('ಕನ್ನಡ', AppLanguage.kannada),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ▶ CONTINUE
                  SizedBox(
                    width: 220,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () => continueApp(context),
                      child: Text(
                        AppText.continueText,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _languageChip(String label, AppLanguage lang) {
    final bool selected = AppLanguageState.current == lang;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () async {
        await AppLanguageState.setLanguage(lang);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.green.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.green.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
