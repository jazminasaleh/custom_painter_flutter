import 'package:diseno/src/pages/animaciones_page.dart';
import 'package:diseno/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diaños apps',
      home: AnimacionesPage()
    );
  }
}