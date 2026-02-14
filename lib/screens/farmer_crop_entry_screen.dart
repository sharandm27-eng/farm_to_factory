import 'package:flutter/material.dart';

import '../utils/sell_crop_text.dart';

class FarmerCropEntryScreen extends StatefulWidget {
  const FarmerCropEntryScreen({super.key});

  @override
  State<FarmerCropEntryScreen> createState() =>
      _FarmerCropEntryScreenState();
}

class _FarmerCropEntryScreenState extends State<FarmerCropEntryScreen> {
  final TextEditingController varietyController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String selectedCrop = '';
  String selectedGrade = '';

  final List<String> grades = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SellCropText.t("title")),
        backgroundColor: Colors.green.shade700,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🥦 Crop Type
            Text(
              SellCropText.t("cropType"),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Tomato', child: Text('Tomato')),
                DropdownMenuItem(value: 'Onion', child: Text('Onion')),
                DropdownMenuItem(value: 'Chilli', child: Text('Chilli')),
                DropdownMenuItem(value: 'Potato', child: Text('Potato')),
              ],
              onChanged: (v) => setState(() => selectedCrop = v ?? ''),
              decoration: _inputDecoration(),
            ),

            const SizedBox(height: 16),

            /// 🌱 Variety
            Text(
              SellCropText.t("variety"),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: varietyController,
              decoration: _inputDecoration(hint: "e.g. Hybrid, Local"),
            ),

            const SizedBox(height: 16),

            /// ⚖ Quantity
            Text(
              SellCropText.t("quantity"),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration(hint: "e.g. 500"),
            ),

            const SizedBox(height: 16),

            /// 💰 Expected Price
            Text(
              SellCropText.t("expectedPrice"),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration(hint: "₹ / kg"),
            ),
            const SizedBox(height: 6),
            Text(
              SellCropText.t("priceNote"),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            /// 🏅 Quality Grade
            Text(
              SellCropText.t("qualityGrade"),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              items: grades
                  .map(
                    (g) => DropdownMenuItem(
                      value: g,
                      child: Text("Grade $g"),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => selectedGrade = v ?? ''),
              decoration: _inputDecoration(),
            ),

            const SizedBox(height: 20),

            /// 📜 Grading Rules (Localized)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SellCropText.t("gradingRulesTitle"),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("• ${SellCropText.t("rule1")}"),
                  Text("• ${SellCropText.t("rule2")}"),
                  Text("• ${SellCropText.t("rule3")}"),
                ],
              ),
            ),

            const SizedBox(height: 28),

            /// ✅ Submit Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _submitCrop,
                child: Text(
                  SellCropText.t("submit"),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🎯 Submit Logic (placeholder)
  void _submitCrop() {
    if (selectedCrop.isEmpty ||
        quantityController.text.isEmpty ||
        priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    Navigator.pop(context);
  }

  /// 🎨 Common input decoration
  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
