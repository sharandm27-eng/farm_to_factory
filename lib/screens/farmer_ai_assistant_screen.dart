  import 'package:flutter/material.dart';

  import '../utils/app_text.dart';
  import '../utils/app_language.dart';
  import '../utils/voice_guide.dart';
  import '../utils/ai_price_estimator.dart';
  import '../utils/ai_crop_advisor.dart';

  class FarmerAiAssistantScreen extends StatefulWidget {
    const FarmerAiAssistantScreen({super.key});

    @override
    State<FarmerAiAssistantScreen> createState() =>
        _FarmerAiAssistantScreenState();
  }

  class _FarmerAiAssistantScreenState
      extends State<FarmerAiAssistantScreen> {
    final TextEditingController locationController =
        TextEditingController();
    final TextEditingController seasonController =
        TextEditingController();

    String cropName = '';
    String advice = '';

    @override
    void initState() {
      super.initState();

      // 🔊 Speak when screen opens
      WidgetsBinding.instance.addPostFrameCallback((_) {
        VoiceGuide.speak(AppText.aiAssistantTitle);
      });
    }

    void getAdvice() {
      final lang = AppLanguageState.current;

      final cropAdvice = AiCropAdvisor.getAdvice(
        location: locationController.text,
        season: seasonController.text,
        language: lang,
      );

      final priceAdvice = AiPriceEstimator.estimate(
        crop: cropName,
        language: lang,
      );

      final result = '$cropAdvice\n\n$priceAdvice';

      setState(() {
        advice = result;
      });

      // 🔊 Speak result
      VoiceGuide.speak(result);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('AI assitant'),
          backgroundColor: Colors.green.shade700,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 📍 Location
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: AppText.location,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 🌦️ Season
                TextField(
                  controller: seasonController,
                  decoration: InputDecoration(
                    labelText: AppText.season,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 🌱 Crop name
                TextField(
                  decoration: InputDecoration(
                    labelText: AppText.cropName,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (v) => cropName = v,
                ),

                const SizedBox(height: 24),

                // 🤖 Get Advice Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: getAdvice,
                    child: Text(
                      AppText.getAdvice,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 📊 Result
                if (advice.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      advice,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }
  }
