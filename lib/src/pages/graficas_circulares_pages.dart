import 'dart:math';

import 'package:diseno/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircualresPage extends StatefulWidget {
  const GraficasCircualresPage({super.key});

  @override
  State<GraficasCircualresPage> createState() => _GraficasCircualresPageState();
}

class _GraficasCircualresPageState extends State<GraficasCircualresPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje += Random().nextInt(20);
              if (porcentaje > 100) porcentaje = 0;
            });
          }),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
                porcentaje: porcentaje, color: Color.fromARGB(255, 252, 22, 5), colorS: Colors.white,),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
                porcentaje: porcentaje, color: Color.fromARGB(255, 5, 249, 13), colorS: Colors.red,),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
                porcentaje: porcentaje, color: Color.fromARGB(255, 251, 3, 86), colorS: Color.fromARGB(255, 86, 86, 86),),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
              porcentaje: porcentaje,
              color: Color.fromARGB(255, 1, 136, 247), colorS: Colors.brown,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
              porcentaje: porcentaje,
              color: Color.fromARGB(255, 239, 247, 1), colorS: Colors.deepOrange,
            ),
          ],
        ),
      ]),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final Color colorS;
  const CustomRadialProgress({
    required this.porcentaje,
    required this.color, 
    required this.colorS,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
          porcenataje: porcentaje,
          colorPrimario: color,
          colorSecundario: colorS,
          grosorSecundario: 7,
          grosorPrimario: 10, colorFondo: Colors.grey,),
    );
  }
}
