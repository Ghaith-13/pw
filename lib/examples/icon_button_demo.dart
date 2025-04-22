import 'package:flutter/material.dart';
import '../widgets/icon_button.dart';
import '../core/style/colors.dart';

class IconButtonDemo extends StatelessWidget {
  const IconButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: [
              // Default icon button
              AppIconButton(
                icon: Icons.home,
                onPressed: () => print('Home button pressed'),
              ),

              // Bordered icon button
              AppIconButton(
                icon: Icons.settings,
                onPressed: () => print('Settings button pressed'),
                hasBorder: true,
              ),

              // Icon button with custom colors
              AppIconButton(
                icon: Icons.favorite,
                onPressed: () => print('Favorite button pressed'),
                backgroundColor: Colors.red,
                iconColor: Colors.white,
              ),

              // Disabled icon button
              AppIconButton(
                icon: Icons.add,
                onPressed: () => print('Add button pressed'),
                isDisabled: true,
              ),

              // Loading icon button
              AppIconButton(
                icon: Icons.refresh,
                onPressed: () => print('Refresh button pressed'),
                isLoading: true,
              ),

              // Custom size icon button
              AppIconButton(
                icon: Icons.star,
                onPressed: () => print('Star button pressed'),
                size: 64.0,
                iconSize: 32.0,
                backgroundColor: AppColors.backgroundSemanticBlue100,
              ),

              // Custom widget as icon
              AppIconButton(
                iconWidget: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
                onPressed: () => print('Logo button pressed'),
                size: 56.0,
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
