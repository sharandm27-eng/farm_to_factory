import 'app_language.dart';

class AppText {
  /// Translation resolver
  static String t(String key) {
    final lang = AppLanguageState.current;
    return _data[key]?[lang] ??
        _data[key]?[AppLanguage.english] ??
        key;
  }


  // ───────── APP / HOME ─────────
  static String get appTagline => t('appTagline');
  static String get selectLanguage => t('selectLanguage');
  static String get continueText => t('continueText');

  // ───────── ROLE SELECTION ─────────
  static String get selectRole => t('selectRole');
  static String get farmer => t('farmer');
  static String get factory => t('factory');

  // ───────── OTP / LOGIN ─────────
  static String get loginTitle => t('loginTitle');
  static String get enterMobile => t('enterMobile');
  static String get sendOtp => t('sendOtp');

  // ───────── FARMER DASHBOARD ─────────
  static String get farmerDashboardTitle => t('farmerDashboardTitle');
  static String get totalListings => t('totalListings');
  static String get activeListings => t('activeListings');
  static String get bestOffer => t('bestOffer');
  static String get totalEarnings => t('totalEarnings');
  static String get thisMonth => t('thisMonth');
  static String get activeBuyers => t('activeBuyers');
  static String get inYourArea => t('inYourArea');

  // ───────── FACTORY DASHBOARD ─────────
  static String get factoryDashboardTitle => t('factoryDashboardTitle');
  static String get factoryDashboardSubtitle => t('factoryDashboardSubtitle');
  static String get totalCrops => t('totalCrops');
  static String get totalFarmers => t('totalFarmers');
  static String get totalFactories => t('totalFactories');
  static String get pendingOrders => t('pendingOrders');
  static String get cropDistribution => t('cropDistribution');

  // ───────── AI ASSISTANT ─────────
  static String get aiAssistantTitle => t('aiAssistantTitle');
  static String get location => t('location');
  static String get season => t('season');
  static String get cropName => t('cropName');
  static String get getAdvice => t('getAdvice');

  // ───────── ACTIONS ─────────
  static String get sellCrop => t('sellCrop');
  static String get checkPrices => t('checkPrices');

  // ───────── LISTINGS / CROPS ─────────
  static String get myListings => t('myListings');
  static String get tomato => t('tomato');
  static String get onion => t('onion');
  static String get chilli => t('chilli');
  static String get rice => t('rice');
  static String get kg => t('kg');
  static String get gunturAp => t('gunturAp');

  static String get negotiating => t('negotiating');
  static String get sold => t('sold');
  // ───────── APP NAME ─────────
static String get appName => 'Farm to Factory';

// ───────── CROPS (CHART) ─────────
static String get wheat => t('wheat');
static String get maize => t('maize');


  // ───────── TRANSLATIONS DATA ─────────
  static const Map<String, Map<AppLanguage, String>> _data = {
    // HOME
    'appTagline': {
      AppLanguage.english: 'Direct Farm to Factory',
      AppLanguage.hindi: 'सीधे खेत से फैक्ट्री',
      AppLanguage.telugu: 'నేరుగా రైతు నుంచి ఫ్యాక్టరీకి',
      AppLanguage.kannada: 'ನೇರವಾಗಿ ರೈತರಿಂದ ಕಾರ್ಖಾನೆಗೆ',
    },
    'selectLanguage': {
      AppLanguage.english: 'Select Your Language',
      AppLanguage.hindi: 'अपनी भाषा चुनें',
      AppLanguage.telugu: 'మీ భాషను ఎంచుకోండి',
      AppLanguage.kannada: 'ನಿಮ್ಮ ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ',
    },
    'continueText': {
      AppLanguage.english: 'Continue',
      AppLanguage.hindi: 'जारी रखें',
      AppLanguage.telugu: 'కొనసాగించండి',
      AppLanguage.kannada: 'ಮುಂದುವರಿಸಿ',
    },

    // ROLE
    'selectRole': {
      AppLanguage.english: 'Select Your Role',
      AppLanguage.hindi: 'अपनी भूमिका चुनें',
      AppLanguage.telugu: 'మీ పాత్రను ఎంచుకోండి',
      AppLanguage.kannada: 'ನಿಮ್ಮ ಪಾತ್ರ ಆಯ್ಕೆಮಾಡಿ',
    },
    'farmer': {
      AppLanguage.english: 'Farmer',
      AppLanguage.hindi: 'किसान',
      AppLanguage.telugu: 'రైతు',
      AppLanguage.kannada: 'ರೈತ',
    },
    'factory': {
      AppLanguage.english: 'Factory',
      AppLanguage.hindi: 'फैक्ट्री',
      AppLanguage.telugu: 'ఫ్యాక్టరీ',
      AppLanguage.kannada: 'ಕಾರ್ಖಾನೆ',
    },

    // LOGIN
    'loginTitle': {
      AppLanguage.english: 'Login',
      AppLanguage.hindi: 'लॉगिन',
      AppLanguage.telugu: 'లాగిన్',
      AppLanguage.kannada: 'ಲಾಗಿನ್',
    },
    'enterMobile': {
      AppLanguage.english: 'Enter Mobile Number',
      AppLanguage.hindi: 'मोबाइल नंबर दर्ज करें',
      AppLanguage.telugu: 'మొబైల్ నంబర్ నమోదు చేయండి',
      AppLanguage.kannada: 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ',
    },
    'sendOtp': {
      AppLanguage.english: 'Send OTP',
      AppLanguage.hindi: 'ओटीपी भेजें',
      AppLanguage.telugu: 'OTP పంపండి',
      AppLanguage.kannada: 'OTP ಕಳುಹಿಸಿ',
    },

    // FARMER
    'farmerDashboardTitle': {
      AppLanguage.english: 'Farmer Dashboard',
      AppLanguage.hindi: 'किसान डैशबोर्ड',
      AppLanguage.telugu: 'రైతు డ్యాష్‌బోర్డ్',
      AppLanguage.kannada: 'ರೈತ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್',
    },

    // FACTORY
    'factoryDashboardTitle': {
      AppLanguage.english: 'Factory Dashboard',
      AppLanguage.hindi: 'फैक्ट्री डैशबोर्ड',
      AppLanguage.telugu: 'ఫ్యాక్టరీ డ్యాష్‌బోర్డ్',
      AppLanguage.kannada: 'ಕಾರ್ಖಾನೆ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್',
    },
    'factoryDashboardSubtitle': {
      AppLanguage.english: 'Live procurement overview',
      AppLanguage.hindi: 'लाइव खरीद अवलोकन',
      AppLanguage.telugu: 'లైవ్ కొనుగోలు అవలోకనం',
      AppLanguage.kannada: 'ಲೈವ್ ಖರೀದಿ ಅವಲೋಕನ',
    },

    // AI
    'aiAssistantTitle': {
      AppLanguage.english: 'AI Crop Advisor',
      AppLanguage.hindi: 'एआई फसल सलाहकार',
      AppLanguage.telugu: 'AI పంట సలహాదారు',
      AppLanguage.kannada: 'AI ಬೆಳೆ ಸಲಹೆಗಾರ',
    },

    // CROPS
    'tomato': {
      AppLanguage.english: 'Tomato',
      AppLanguage.hindi: 'टमाटर',
      AppLanguage.telugu: 'టమాటా',
      AppLanguage.kannada: 'ಟೊಮೇಟೊ',
    },
    'onion': {
      AppLanguage.english: 'Onion',
      AppLanguage.hindi: 'प्याज़',
      AppLanguage.telugu: 'ఉల్లి',
      AppLanguage.kannada: 'ಈರುಳ್ಳಿ',
    },
    'chilli': {
      AppLanguage.english: 'Chilli',
      AppLanguage.hindi: 'मिर्च',
      AppLanguage.telugu: 'మిరప',
      AppLanguage.kannada: 'ಮೆಣಸು',
    },
    'rice': {
      AppLanguage.english: 'Rice',
      AppLanguage.hindi: 'चावल',
      AppLanguage.telugu: 'బియ్యం',
      AppLanguage.kannada: 'ಅಕ್ಕಿ',
    },

    'kg': {
      AppLanguage.english: 'kg',
      AppLanguage.hindi: 'किलो',
      AppLanguage.telugu: 'కిలో',
      AppLanguage.kannada: 'ಕೆಜಿ',
    },
    'gunturAp': {
      AppLanguage.english: 'Guntur, AP',
      AppLanguage.hindi: 'गुंटूर, आंध्र प्रदेश',
      AppLanguage.telugu: 'గుంటూరు, ఏపీ',
      AppLanguage.kannada: 'ಗುಂಟೂರು, ಆಂಧ್ರ',
    },

    'negotiating': {
      AppLanguage.english: 'Negotiating',
      AppLanguage.hindi: 'बातचीत',
      AppLanguage.telugu: 'చర్చలు',
      AppLanguage.kannada: 'ಚರ್ಚೆ',
    },
    'sold': {
      AppLanguage.english: 'Sold',
      AppLanguage.hindi: 'बिक गया',
      AppLanguage.telugu: 'అమ్ముడైంది',
      AppLanguage.kannada: 'ಮಾರಾಟವಾಗಿದೆ',
    },
  };
}
