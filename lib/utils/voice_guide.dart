import 'package:flutter_tts/flutter_tts.dart';
import 'app_language.dart';

class VoiceGuide {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text) async {
    // 🔹 Set language based on selected app language
    switch (AppLanguageState.current) {
      case AppLanguage.telugu:
        await _tts.setLanguage('te-IN');
        break;
      case AppLanguage.hindi:
        await _tts.setLanguage('hi-IN');
        break;
      case AppLanguage.kannada:
        await _tts.setLanguage('kn-IN');
        break;
      default:
        await _tts.setLanguage('en-US');
    }

    // 🔹 Speech tuning
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);

    // 🔹 Stop previous speech (important!)
    await _tts.stop();

    // 🔹 Speak
    await _tts.speak(text);
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}
