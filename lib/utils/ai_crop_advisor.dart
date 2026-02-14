import 'app_language.dart';

class AiCropAdvisor {
  static String getAdvice({
    required String location,
    required String season,
    required AppLanguage language,
  }) {
    if (season.toLowerCase() == 'kharif') {
      return _kharifAdvice(language);
    } else if (season.toLowerCase() == 'rabi') {
      return _rabiAdvice(language);
    } else {
      return _genericAdvice(language);
    }
  }

  static String _kharifAdvice(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.telugu:
        return 'వరి, మొక్కజొన్న పంటలు మంచి ఎంపిక. ధరలు పెరిగే అవకాశం ఉంది.';
      case AppLanguage.hindi:
        return 'धान और मक्का सबसे अच्छे विकल्प हैं। कीमतें बढ़ सकती हैं।';
      case AppLanguage.kannada:
        return 'ಅಕ್ಕಿ ಮತ್ತು ಮೆಕ್ಕೆಜೋಳ ಉತ್ತಮ ಬೆಳೆಗಳು. ಬೆಲೆ ಏರಿಕೆ ಸಾಧ್ಯತೆ ಇದೆ.';
      default:
        return 'Rice and maize are good crops. Prices may increase.';
    }
  }

  static String _rabiAdvice(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.telugu:
        return 'గోధుమలు మరియు శనగలు మంచి పంటలు.';
      case AppLanguage.hindi:
        return 'गेहूं और चना अच्छी फसलें हैं।';
      case AppLanguage.kannada:
        return 'ಗೋಧಿ ಮತ್ತು ಕಡಲೆ ಉತ್ತಮ ಬೆಳೆಗಳು.';
      default:
        return 'Wheat and chickpea are good crops.';
    }
  }

  static String _genericAdvice(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.telugu:
        return 'మీ ప్రాంతానికి సరైన పంటను ఎంచుకోండి.';
      case AppLanguage.hindi:
        return 'अपने क्षेत्र के अनुसार फसल चुनें।';
      case AppLanguage.kannada:
        return 'ನಿಮ್ಮ ಪ್ರದೇಶಕ್ಕೆ ಹೊಂದುವ ಬೆಳೆ ಆಯ್ಕೆಮಾಡಿ.';
      default:
        return 'Choose crops suitable for your region.';
    }
  }
}
