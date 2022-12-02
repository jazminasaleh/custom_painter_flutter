import 'package:diseno/src/pages/emergency_page.dart';
import 'package:diseno/src/pages/pinterest_page.dart';
import 'package:diseno/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diaños apps',
      home: EmergencyPage()
    );
  }
}