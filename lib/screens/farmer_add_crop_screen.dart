import 'package:flutter/material.dart';

class FarmerAddCropScreen extends StatefulWidget {
  const FarmerAddCropScreen({super.key});

  @override
  State<FarmerAddCropScreen> createState() => _FarmerAddCropScreenState();
}

class _FarmerAddCropScreenState extends State<FarmerAddCropScreen> {
  String? selectedCrop;
  String? selectedGrade;
  bool acceptedTerms = false;

  final List<String> cropTypes = [
    'Tomato',
    'Chilli',
    'Onion',
  ];

  final List<String> grades = ['Grade A', 'Grade B', 'Grade C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Crop'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label('Crop Type'),
            _cropDropdown(),

            _label('Variety'),
            _input('e.g. Guntur S4, Hybrid 102'),

            _label('Quantity (kg)'),
            _input('Enter quantity', suffix: 'kg'),

            _label('Harvest Date'),
            _datePicker(context),

            _label('Quality Grade (Optional)'),
            _gradeDropdown(),

            _termsAndConditions(),

            _label('Expected Price (₹/kg)'),
            _input('Enter expected price', prefix: '₹', suffix: '/kg'),

            const SizedBox(height: 24),

            _label('Upload Photos'),
            _uploadBox(),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text(
                  'Post Listing',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: acceptedTerms
                    ? () {
                        // submit logic later
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- helpers (UNCHANGED, only extended) ----------

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _input(String hint, {String? prefix, String? suffix}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefix,
        suffixText: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ✅ FIXED crop dropdown
  Widget _cropDropdown() {
    return DropdownButtonFormField<String>(
        initialValue: selectedCrop,
      hint: const Text('Select crop type'),
      items: cropTypes
          .map(
            (crop) => DropdownMenuItem(
              value: crop,
              child: Text(crop),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCrop = value;
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  // ✅ Grade dropdown with rules
  Widget _gradeDropdown() {
    return DropdownButtonFormField<String>(
        initialValue: selectedGrade,
      hint: const Text('Select grade'),
      items: grades
          .map(
            (grade) => DropdownMenuItem(
              value: grade,
              child: Text(grade),
            ),
          )
          .toList(),
      onChanged: acceptedTerms
          ? (value) {
              setState(() {
                selectedGrade = value;
              });
            }
          : null,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  // ✅ Terms & Conditions (required for grades)
  Widget _termsAndConditions() {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: acceptedTerms,
      onChanged: (value) {
        setState(() {
          acceptedTerms = value ?? false;
          if (!acceptedTerms) {
            selectedGrade = null;
          }
        });
      },
      title: const Text('Accept quality grading terms'),
      subtitle: const Text(
        'Grade A: Premium quality\n'
        'Grade B: Standard quality\n'
        'Grade C: Average quality',
      ),
    );
  }

  Widget _datePicker(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
      },
      child: Container(
        height: 56,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.calendar_today),
            SizedBox(width: 12),
            Text('Select harvest date'),
          ],
        ),
      ),
    );
  }

  Widget _uploadBox() {
    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.camera_alt, size: 32),
            SizedBox(height: 8),
            Text('Add Photo'),
          ],
        ),
      ),
    );
  }
}
