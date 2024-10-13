import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'catalog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store',
      theme: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: CatalogPage(toggleTheme: _toggleTheme),
    );
  }
}