enum AppLanguage {
  english,
  telugu,
  hindi,
  kannada,
}

class AppLanguageState {
  static AppLanguage _current = AppLanguage.english;

  static AppLanguage get current => _current;

  static Future<void> setLanguage(AppLanguage lang) async {
    _current = lang;
  }

  // 🔑 Main translation method
  static String translate(String key) {
    return _localizedValues[_current]?[key] ??
        _localizedValues[AppLanguage.english]?[key] ??
        key;
  }

  // 🌍 All app translations
  static final Map<AppLanguage, Map<String, String>> _localizedValues = {
    AppLanguage.english: {
      // General
      'farmerDashboardTitle': 'Farmer Dashboard',
      'smartSowingTitle': 'Smart Sowing',
      'smartSowingDesc': 'Best crop suggestion for next season',
      'myListings': 'My Listings',
      'negotiating': 'Negotiating',
      'sold': 'Sold',

      // Crops
      'tomato': 'Tomato',
      'onion': 'Onion',

      // Units & location
      'kg': 'kg',
      'gunturAp': 'Guntur, AP',
    },

    AppLanguage.telugu: {
      // General
      'farmerDashboardTitle': 'రైతు డాష్‌బోర్డ్',
      'smartSowingTitle': 'స్మార్ట్ సాగు',
      'smartSowingDesc': 'తదుపరి సీజన్‌కు లాభదాయకమైన పంట సూచన',
      'myListings': 'నా లిస్టింగ్స్',
      'negotiating': 'చర్చలో ఉంది',
      'sold': 'అమ్మబడింది',

      // Crops
      'tomato': 'టమాటా',
      'onion': 'ఉల్లిపాయ',

      // Units & location
      'kg': 'కిలోలు',
      'gunturAp': 'గుంటూరు, ఏపీ',
    },

    AppLanguage.hindi: {
      // General
      'farmerDashboardTitle': 'किसान डैशबोर्ड',
      'smartSowingTitle': 'स्मार्ट बुवाई',
      'smartSowingDesc': 'अगले मौसम के लिए लाभदायक फसल सुझाव',
      'myListings': 'मेरी लिस्टिंग',
      'negotiating': 'बातचीत जारी',
      'sold': 'बिक गया',

      // Crops
      'tomato': 'टमाटर',
      'onion': 'प्याज़',

      // Units & location
      'kg': 'किलो',
      'gunturAp': 'गुंटूर, आंध्र प्रदेश',
    },

    AppLanguage.kannada: {
      // General
      'farmerDashboardTitle': 'ರೈತ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್',
      'smartSowingTitle': 'ಸ್ಮಾರ್ಟ್ ಬಿತ್ತನೆ',
      'smartSowingDesc': 'ಮುಂದಿನ ಹಂಗಾಮಿಗೆ ಲಾಭದಾಯಕ ಬೆಳೆ ಸಲಹೆ',
      'myListings': 'ನನ್ನ ಪಟ್ಟಿಗಳು',
      'negotiating': 'ಚರ್ಚೆಯಲ್ಲಿ',
      'sold': 'ಮಾರಾಟವಾಗಿದೆ',

      // Crops
      'tomato': 'ಟೊಮೇಟೋ',
      'onion': 'ಈರುಳ್ಳಿ',

      // Units & location
      'kg': 'ಕೆಜಿ',
      'gunturAp': 'ಗುಂಟೂರು, ಆಂಧ್ರ ಪ್ರದೇಶ',
    },
  };
}
