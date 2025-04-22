import 'package:flutter/material.dart';
import '../widgets/switch_button.dart';

class SwitchButtonDemo extends StatefulWidget {
  const SwitchButtonDemo({Key? key}) : super(key: key);

  @override
  State<SwitchButtonDemo> createState() => _SwitchButtonDemoState();
}

class _SwitchButtonDemoState extends State<SwitchButtonDemo> {
  bool _isEnabled = true;
  bool _isDisabled = true;
  bool _customColors = true;
  bool _statusValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Switch Button Variants',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Status switch with label as in screenshot
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SwitchButton(
                value: _statusValue,
                label: 'Status',
                showAsterisk: true,
                onChanged: (value) {
                  setState(() {
                    _statusValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),

            // Default switch - enabled and interactive
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Without Label:'),
                SizedBox(width: 8),
                SwitchButton(
                  value: _isEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // With label version
            SwitchButton(
              value: _isEnabled,
              label: 'Enabled Switch',
              onChanged: (value) {
                setState(() {
                  _isEnabled = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // Disabled switch - non-interactive
            SwitchButton(
              value: _isDisabled,
              label: 'Disabled Switch',
              isEnabled: false,
              onChanged: (value) {
                // This won't be called because the switch is disabled
                setState(() {
                  _isDisabled = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // Custom colors switch
            SwitchButton(
              value: _customColors,
              label: 'Custom Colors Switch',
              activeColor: Colors.purple,
              inactiveColor: Colors.grey.shade400,
              thumbColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _customColors = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // Custom sized switch
            SwitchButton(
              value: _isEnabled,
              label: 'Custom Size Switch',
              width: 64.0,
              height: 38.0,
              onChanged: (value) {
                setState(() {
                  _isEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
