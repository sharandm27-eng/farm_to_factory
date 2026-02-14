import '../models/crop_price_model.dart';
import 'app_language.dart';

class AiPriceEstimator {
  static final List<CropPriceModel> _prices = [
    CropPriceModel(crop: 'rice', minPrice: 22, maxPrice: 30),
    CropPriceModel(crop: 'wheat', minPrice: 24, maxPrice: 32),
    CropPriceModel(crop: 'maize', minPrice: 18, maxPrice: 25),
    CropPriceModel(crop: 'cotton', minPrice: 55, maxPrice: 70),
  ];

  static String estimate({
    required String crop,
    required AppLanguage language,
  }) {
    final data = _prices.firstWhere(
      (e) => e.crop.toLowerCase() == crop.toLowerCase(),
      orElse: () =>
          CropPriceModel(crop: crop, minPrice: 20, maxPrice: 28),
    );

    switch (language) {
      case AppLanguage.telugu:
        return '${crop.toUpperCase()} ధర ₹${data.minPrice} – ₹${data.maxPrice} प्रति కిలో. లాభ అవకాశం ఉంది.';
      case AppLanguage.hindi:
        return '${crop.toUpperCase()} की कीमत ₹${data.minPrice} – ₹${data.maxPrice} प्रति किलो हो सकती है।';
      case AppLanguage.kannada:
        return '${crop.toUpperCase()} ಬೆಲೆ ₹${data.minPrice} – ₹${data.maxPrice} ಪ್ರತಿ ಕಿಲೋ.';
      default:
        return '${crop.toUpperCase()} price may be ₹${data.minPrice} – ₹${data.maxPrice} per kg.';
    }
  }
}
