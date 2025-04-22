import 'package:flutter/material.dart';
import '../widgets/checkbox.dart';
import '../core/style/colors.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key? key}) : super(key: key);

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _isChecked1 = false;
  bool _isChecked2 = true;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Demo'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checkbox Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Container to constrain width like in screenshot
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    // Basic checkbox with label (unchecked)
                    CustomCheckbox(
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          _isChecked1 = value;
                        });
                      },
                      label: 'Smoothswipe',
                      activeColor:
                          const Color(0xFF03A4AA), // Teal from screenshot
                    ),
                    const SizedBox(height: 16),

                    // Checked checkbox with label
                    CustomCheckbox(
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          _isChecked2 = value;
                        });
                      },
                      label: 'Publishii',
                      activeColor:
                          const Color(0xFF03A4AA), // Teal from screenshot
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'Additional Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Disabled checkbox
            CustomCheckbox(
              value: _isChecked3,
              onChanged: (value) {
                setState(() {
                  _isChecked3 = value;
                });
              },
              label: 'Disabled option',
              isEnabled: false,
            ),
            const SizedBox(height: 16),

            // Custom styled checkbox
            CustomCheckbox(
              value: _isChecked4,
              onChanged: (value) {
                setState(() {
                  _isChecked4 = value;
                });
              },
              label: 'Custom styled checkbox',
              activeColor: Colors.blue,
              checkColor: Colors.white,
              size: 28.0,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
