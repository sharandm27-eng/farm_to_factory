import 'app_language.dart';

class SellCropText {
  // ✅ Made final to remove warning
  static final Map<AppLanguage, Map<String, String>> _data = {
    AppLanguage.english: {
      "title": "Sell Crop",
      "cropType": "Crop Type",
      "variety": "Variety",
      "quantity": "Quantity (kg)",
      "expectedPrice": "Expected Price (₹/kg)",
      "priceNote":
          "This price is hidden from factories and used for AI matching.",
      "qualityGrade": "Quality Grade",
      "gradingRulesTitle": "Grading Rules",
      "rule1": "Fresh produce",
      "rule2": "Less damage = higher grade",
      "rule3": "Uniform size preferred",
      "submit": "Submit Crop",
    },

    AppLanguage.telugu: {
      "title": "పంట అమ్మకం",
      "cropType": "పంట రకం",
      "variety": "వైవిధ్యం",
      "quantity": "పరిమాణం (కిలోలు)",
      "expectedPrice": "ఆశించిన ధర (₹/కిలో)",
      "priceNote":
          "ఈ ధర ఫ్యాక్టరీలకు కనిపించదు. AI సరిపోల్చడానికి ఉపయోగిస్తారు.",
      "qualityGrade": "నాణ్యత గ్రేడ్",
      "gradingRulesTitle": "గ్రేడింగ్ నియమాలు",
      "rule1": "తాజా ఉత్పత్తి",
      "rule2": "తక్కువ నష్టం = ఎక్కువ గ్రేడ్",
      "rule3": "సమాన పరిమాణం కావాలి",
      "submit": "సబ్మిట్ చేయండి",
    },

    AppLanguage.hindi: {
      "title": "फसल बेचें",
      "cropType": "फसल प्रकार",
      "variety": "किस्म",
      "quantity": "मात्रा (किलो)",
      "expectedPrice": "अपेक्षित मूल्य (₹/किलो)",
      "priceNote":
          "यह मूल्य फैक्ट्रियों को नहीं दिखाया जाता। AI मिलान के लिए उपयोग होता है।",
      "qualityGrade": "गुणवत्ता ग्रेड",
      "gradingRulesTitle": "ग्रेडिंग नियम",
      "rule1": "ताज़ी उपज",
      "rule2": "कम नुकसान = बेहतर ग्रेड",
      "rule3": "एक समान आकार पसंदीदा",
      "submit": "सबमिट करें",
    },

    AppLanguage.kannada: {
      "title": "ಬೆಳೆ ಮಾರಾಟ",
      "cropType": "ಬೆಳೆ ಪ್ರಕಾರ",
      "variety": "ವೈವಿಧ್ಯ",
      "quantity": "ಪ್ರಮಾಣ (ಕೆಜಿ)",
      "expectedPrice": "ನಿರೀಕ್ಷಿತ ಬೆಲೆ (₹/ಕೆಜಿ)",
      "priceNote":
          "ಈ ಬೆಲೆ ಕಾರ್ಖಾನೆಗಳಿಗೆ ಕಾಣುವುದಿಲ್ಲ. AI ಹೊಂದಾಣಿಕೆಗೆ ಬಳಸಲಾಗುತ್ತದೆ.",
      "qualityGrade": "ಗುಣಮಟ್ಟ ಗ್ರೇಡ್",
      "gradingRulesTitle": "ಗ್ರೇಡಿಂಗ್ ನಿಯಮಗಳು",
      "rule1": "ತಾಜಾ ಉತ್ಪನ್ನ",
      "rule2": "ಕಡಿಮೆ ಹಾನಿ = ಹೆಚ್ಚಿನ ಗ್ರೇಡ್",
      "rule3": "ಒಂದೇ ಗಾತ್ರ ಮೆಚ್ಚುಗೆ",
      "submit": "ಸಲ್ಲಿಸು",
    },
  };

  static String t(String key) {
    return _data[AppLanguageState.current]?[key] ??
        _data[AppLanguage.english]![key]!;
  }
}
