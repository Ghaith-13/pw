import 'package:flutter/material.dart';
import '../widgets/radio_button.dart';
import '../core/style/colors.dart';

class RadioButtonDemo extends StatefulWidget {
  const RadioButtonDemo({Key? key}) : super(key: key);

  @override
  State<RadioButtonDemo> createState() => _RadioButtonDemoState();
}

class _RadioButtonDemoState extends State<RadioButtonDemo> {
  String _selectedOption = 'option1';
  String _selectedSize = 'medium';
  int _selectedNumber = 1;
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Button Demo'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Simple radio button
            const Text(
              'Single Radio Buttons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            CustomRadioButton<String>(
              groupValue: _selectedOption,
              value: 'option1',
              label: 'Option 1',
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),

            const SizedBox(height: 10),

            CustomRadioButton<String>(
              groupValue: _selectedOption,
              value: 'option2',
              label: 'Option 2',
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // Radio button group
            const Text(
              'Radio Button Group',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            CustomRadioGroup<String>(
              values: const ['small', 'medium', 'large'],
              labels: const ['Small', 'Medium', 'Large'],
              initialValue: _selectedSize,
              onChanged: (value) {
                setState(() {
                  _selectedSize = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // Numeric radio group
            const Text(
              'Numeric Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            CustomRadioGroup<int>(
              values: const [1, 2, 3],
              labels: const ['One', 'Two', 'Three'],
              initialValue: _selectedNumber,
              onChanged: (value) {
                setState(() {
                  _selectedNumber = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // Custom styling
            const Text(
              'Custom Styling',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            CustomRadioButton<String>(
              groupValue: _selectedOption,
              value: 'custom1',
              label: 'Custom Radio 1',
              activeColor: Colors.purple,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),

            const SizedBox(height: 10),

            CustomRadioButton<String>(
              groupValue: _selectedOption,
              value: 'custom2',
              label: 'Custom Radio 2',
              activeColor: Colors.orange,
              size: 20,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),

            const SizedBox(height: 10),

            CustomRadioButton<String>(
              groupValue: _selectedOption,
              value: 'custom3',
              label: 'Custom Check Color',
              activeColor: Colors.blue,
              checkColor: Colors.yellow,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // Disabled radio buttons
            Row(
              children: [
                const Text(
                  'Enable/Disable:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: _isEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isEnabled = value;
                    });
                  },
                  activeColor: AppColors.primary,
                ),
              ],
            ),

            const SizedBox(height: 16),

            CustomRadioGroup<String>(
              values: const ['disabled1', 'disabled2'],
              labels: const ['Disabled Option 1', 'Disabled Option 2'],
              initialValue: 'disabled1',
              isEnabled: _isEnabled,
              onChanged: (value) {
                // This won't be called when disabled
              },
            ),
          ],
        ),
      ),
    );
  }
}
