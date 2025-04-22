import 'package:flutter/material.dart';
import '../widgets/close_button.dart';
import '../core/style/colors.dart';

class CloseButtonDemo extends StatelessWidget {
  const CloseButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Close Button Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Default close button
            const Text('Default Close Button'),
            const SizedBox(height: 16),
            AppCloseButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Default close button pressed')),
                );
              },
            ),
            const SizedBox(height: 32),

            // Custom size close button
            const Text('Larger Close Button'),
            const SizedBox(height: 16),
            AppCloseButton(
              size: 60,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Large close button pressed')),
                );
              },
            ),
            const SizedBox(height: 32),

            // Bordered close button
            const Text('Bordered Close Button'),
            const SizedBox(height: 16),
            AppCloseButton(
              hasBorder: true,
              borderColor: AppColors.primary,
              iconColor: AppColors.primary,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Bordered close button pressed')),
                );
              },
            ),
            const SizedBox(height: 32),

            // Custom color close button
            const Text('Custom Color Close Button'),
            const SizedBox(height: 16),
            AppCloseButton(
              backgroundColor: AppColors.backgroundBlack100,
              iconColor: AppColors.iconWhite100,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Custom color close button pressed')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
