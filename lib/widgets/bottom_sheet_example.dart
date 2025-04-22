import 'package:flutter/material.dart';
import 'app_bottom_sheet.dart';

/// Example showing how to use the custom bottom sheet
class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button to show the specialized Add Role bottom sheet
            ElevatedButton(
              onPressed: () => _showAddRoleBottomSheet(context),
              child: const Text('Show Add Role Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }

  // Example of using the specialized Add Role bottom sheet
  void _showAddRoleBottomSheet(BuildContext context) {
    AddRoleBottomSheet.show(
      context: context,
      onRoleAdded: (name, type) {
        Navigator.pop(context);
        // Handle role added
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added role: $name ($type)'),
          ),
        );
      },
    );
  }
}
