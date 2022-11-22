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
            CustomRadialProgress(porcentaje: porcentaje, color: Color.fromARGB(255, 252, 22, 5)),
          ],
        ),
          SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           CustomRadialProgress(porcentaje: porcentaje, color: Color.fromARGB(255, 5, 249, 13)),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(porcentaje: porcentaje, color: Color.fromARGB(255, 251, 3, 86)),
          ],
        ),
           SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           CustomRadialProgress(porcentaje: porcentaje, color: Color.fromARGB(255, 1, 136, 247),),
          ],
        ),
             SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           CustomRadialProgress(porcentaje: porcentaje, color: Color.fromARGB(255, 239, 247, 1),),
          ],
        ),
      ]),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    
    required this.porcentaje, required this.color,
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
          colorSecundario: Color.fromARGB(255, 77, 83, 78),
          grosorSecundario: 8,
          grosorPrimario: 10),
    );
  }
}
