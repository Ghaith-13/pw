import 'package:flutter/material.dart';
import 'widgets/main_button.dart';

/// Demo widget to showcase the MainButton component
class MainButtonDemo extends StatelessWidget {
  const MainButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic button
            MainButton(
              text: 'Login',
              onPressed: () {
                // Handle login
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login pressed')),
                );
              },
            ),
            const SizedBox(height: 24),

            // Button with leading icon
            MainButton(
              text: 'Sign Up',
              leadingIcon: Icons.person_add,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign Up pressed')),
                );
              },
            ),
            const SizedBox(height: 24),

            // Button with trailing icon
            MainButton(
              text: 'Continue',
              trailingIcon: Icons.arrow_forward,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Continue pressed')),
                );
              },
            ),
            const SizedBox(height: 24),

            // Loading button
            MainButton(
              text: 'Loading',
              isLoading: true,
              onPressed: () {},
            ),
            const SizedBox(height: 24),

            // Disabled button
            MainButton(
              text: 'Disabled',
              isDisabled: true,
              onPressed: () {},
            ),
            const SizedBox(height: 24),

            // Custom color button
            MainButton(
              text: 'Custom Color',
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Custom button pressed')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
