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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Showcase',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
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
