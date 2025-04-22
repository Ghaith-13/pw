import 'package:flutter/material.dart';
import '../widgets/pin_field.dart';

class PinFieldDemo extends StatefulWidget {
  const PinFieldDemo({Key? key}) : super(key: key);

  @override
  State<PinFieldDemo> createState() => _PinFieldDemoState();
}

class _PinFieldDemoState extends State<PinFieldDemo> {
  String? _errorText;
  String _pin = '';
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIN Field Demo'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Standard PIN field
              AppPinField(
                labelText: 'Enter PIN',
                isRequired: true,
                errorText: _errorText,
                obscureText: _isObscured,
                onChanged: (value) {
                  setState(() {
                    _pin = value;
                    // Clear error when user starts typing
                    if (_errorText != null) {
                      _errorText = null;
                    }
                  });
                },
                onCompleted: (value) {
                  // Validate the pin (for demo purposes: 123456 is valid)
                  if (value != '123456') {
                    setState(() {
                      _errorText = 'Invalid PIN, try 123456';
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('PIN verified successfully!')));
                  }
                },
              ),

              const SizedBox(height: 20),

              // Toggle obscure text
              Row(
                children: [
                  Checkbox(
                    value: _isObscured,
                    onChanged: (value) {
                      setState(() {
                        _isObscured = value ?? false;
                      });
                    },
                  ),
                  const Text('Hide PIN'),
                ],
              ),

              const SizedBox(height: 40),

              // Show entered PIN for demo purposes
              Text(
                'Entered PIN: $_pin',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),

              // Disabled PIN field example
              const AppPinField(
                labelText: 'Disabled PIN field',
                isDisabled: true,
                length: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
