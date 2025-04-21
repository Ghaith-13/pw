import 'package:flutter/material.dart';
import 'widgets/border_button.dart';

/// Demo widget to showcase the BorderButton component
class BorderButtonDemo extends StatelessWidget {
  const BorderButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Border Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic border button
            BorderButton(
              text: 'Reset',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Reset pressed')),
                );
              },
            ),
            const SizedBox(height: 24),

            // Button with leading icon
            BorderButton(
              text: 'Back',
              leadingIcon: Icons.arrow_back,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Back pressed')),
                );
              },
            ),
            const SizedBox(height: 24),

            // Button with trailing icon
            BorderButton(
              text: 'Next',
              trailingIcon: Icons.arrow_forward,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Next pressed')),
                );
              },
            ),
            const SizedBox(height: 24),

            // Loading button
            BorderButton(
              text: 'Loading',
              isLoading: true,
              onPressed: () {},
            ),
            const SizedBox(height: 24),

            // Disabled button
            BorderButton(
              text: 'Disabled',
              isDisabled: true,
              onPressed: () {},
            ),
            const SizedBox(height: 24),

            // Custom color button
            BorderButton(
              text: 'Custom Color',
              borderColor: Colors.deepPurple,
              textColor: Colors.deepPurple,
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
