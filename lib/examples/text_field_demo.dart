import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '../core/style/spacing.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _requiredController = TextEditingController();
  final TextEditingController _errorController = TextEditingController();
  final TextEditingController _disabledController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _requiredController.dispose();
    _errorController.dispose();
    _disabledController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.spacing4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic TextField with label (like in screenshot)
            AppTextField(
              controller: _emailController,
              labelText: 'Email ID',
              hintText: 'Enter email',
              isRequired: true,
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: AppSpacing.spacing4),

            // Password TextField with obscured text
            AppTextField(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Enter password',
              obscureText: true,
              showClearButton: true,
            ),

            SizedBox(height: AppSpacing.spacing4),

            // TextField with error
            AppTextField(
              controller: _errorController,
              labelText: 'With Error',
              hintText: 'Error example',
              errorText: 'This field contains an error',
            ),

            SizedBox(height: AppSpacing.spacing4),

            // Disabled TextField
            AppTextField(
              controller: _disabledController,
              labelText: 'Disabled Field',
              hintText: 'Cannot be edited',
              isDisabled: true,
            ),

            SizedBox(height: AppSpacing.spacing4),

            // TextField with prefix icon
            AppTextField(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
            ),

            SizedBox(height: AppSpacing.spacing4),

            // TextField without label
            AppTextField(
              hintText: 'No label field',
              showClearButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
