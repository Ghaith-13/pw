import 'package:flutter/material.dart';
import 'package:pw/examples/search_field_example.dart';
import 'package:pw/examples/main_button_demo.dart';
import 'package:pw/examples/border_button_demo.dart';
import 'package:pw/examples/icon_button_demo.dart';
import 'package:pw/examples/text_field_demo.dart';
import 'package:pw/examples/close_button_demo.dart';
import 'package:pw/examples/password_text_field_demo.dart';
import 'package:pw/examples/switch_button_demo.dart';
import 'package:pw/examples/checkbox_demo.dart';
import 'package:pw/examples/radio_button_demo.dart';
import 'package:pw/examples/pin_field_demo.dart';
import 'package:pw/widgets/bottom_sheet_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delete Modal Example',
      theme: ThemeData(
        primaryColor: const Color(0xFF03A4AA),
        fontFamily: 'Inter',
      ),
      home: const BottomSheetExample(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Showcase'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainButtonDemo()),
                  );
                },
                child: const Text('View Main Buttons'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BorderButtonDemo()),
                  );
                },
                child: const Text('View Border Buttons'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IconButtonDemo()),
                  );
                },
                child: const Text('View Icon Buttons'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TextFieldDemo()),
                  );
                },
                child: const Text('View Text Fields'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CloseButtonDemo()),
                  );
                },
                child: const Text('View Close Buttons'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasswordTextFieldDemo()),
                  );
                },
                child: const Text('View Password Text Field'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SwitchButtonDemo()),
                  );
                },
                child: const Text('View Switch Button'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckboxDemo()),
                  );
                },
                child: const Text('View Checkbox'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RadioButtonDemo()),
                  );
                },
                child: const Text('View Radio Button'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PinFieldDemo()),
                  );
                },
                child: const Text('View PIN Field'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
