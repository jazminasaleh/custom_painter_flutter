import 'package:diseno/src/labs/circular_progress_page.dart';
import 'package:diseno/src/pages/graficas_circulares_pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diaños apps',
      home: GraficasCircualresPage()
    );
  }
}