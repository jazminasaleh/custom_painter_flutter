import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(microseconds: 800));
    controller.addListener(() {
      //print('valor controller: ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.pink,
          onPressed: () {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += Random().nextInt(20);
            if (nuevoPorcentaje > 100) {
              nuevoPorcentaje = 0;
              porcentaje = 0;
            }
            controller.forward(from: 0.0);
            //*Para notificar que el estado ha cambiado
            setState(() {});
          }),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MiRadialProgress(porcentaje: porcentaje),
            )),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress({this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {
    //*Porcentaje con el que se va llenando el circulo

    //?Lapiz, el ancho, color y si es relleno o solo linea
    //*Circulo completado
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final center = new Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //*Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    //*Parte que se va a ir llenando
    //* 2*pi es el circulo completo
    double arcAngle = 2 * pi * (porcentaje / 100);
    //*Primer argumento:Es el espacio donde se quiere ubicar el circulo
    //*Segundo argumento: es el angulo inicial
    //*Tercer argumento: es el angulo de llenado
    //*Cuarto argumento: si la linea va haciea el cento o no
    //*Quinto argumento: lapiz
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
