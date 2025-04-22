import 'package:flutter/material.dart';
import '../widgets/password_text_field.dart';

class PasswordTextFieldDemo extends StatefulWidget {
  const PasswordTextFieldDemo({Key? key}) : super(key: key);

  @override
  State<PasswordTextFieldDemo> createState() => _PasswordTextFieldDemoState();
}

class _PasswordTextFieldDemoState extends State<PasswordTextFieldDemo> {
  final TextEditingController _passwordController = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorText = 'Password cannot be empty';
      });
    } else if (value.length < 8) {
      setState(() {
        _errorText = 'Password must be at least 8 characters';
      });
    } else {
      setState(() {
        _errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Text Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPasswordTextField(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              isRequired: true,
              errorText: _errorText,
              onChanged: _validatePassword,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _validatePassword(_passwordController.text);
              },
              child: const Text('Validate'),
            ),
          ],
        ),
      ),
    );
  }
}
