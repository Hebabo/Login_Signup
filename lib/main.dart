// main.dart
import 'package:flutter/material.dart';
import 'utils/app_themes.dart';
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
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}
