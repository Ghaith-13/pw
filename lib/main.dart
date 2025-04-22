import 'package:flutter/material.dart';
import 'screens/delete_modal_example_screen.dart';

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
      home: const DeleteModalExampleScreen(),
    );
  }
}
