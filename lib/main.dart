// main.dart
import 'package:flutter/material.dart';
import 'views/main_navigation.dart'; // adjust path if needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}
