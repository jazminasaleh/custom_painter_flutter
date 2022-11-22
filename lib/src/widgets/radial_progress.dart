import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcenataje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
   final double grosorPrimario;
  const RadialProgress(
      {required this.porcenataje,
      this.colorPrimario = Colors.pink,
      this.colorSecundario = Colors.grey,
      this.grosorSecundario = 8.0, 
      this.grosorPrimario = 10.0});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

//?La parte de la animacion
//*whith single... es para la animacion del circulo cuando va aumentando el porcentaje
class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  //*Para las animaciones
  late AnimationController controller;
  //*El porcentaje anterioir
  double? porcentajeAnterior;

  //?Para hacer la respectiva configuracion
  //?Solo se pidspara una vez cuando se dibuja por primera vez
  @override
  void initState() {
    //*El porcentaje anteriori va a ser el mimso que este mandnaod la persona
    porcentajeAnterior = widget.porcenataje;
    //*Se tiene la duracion de la animacion
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  //?Para que se limpie cuando ya se destruya el widget
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //*Para que cada vez que se redibuje el widget se vuelva a hacer la animacion
    controller.forward(from: 0.0);
    //*La cantidad de porcentaje que se tiene que animar
    final difernciaAnimar = widget.porcenataje - porcentajeAnterior;
    porcentajeAnterior = widget.porcenataje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        //*el widget que dibuja el circulo
        return Container(
          padding: EdgeInsets.all(5),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
              painter: _MiRadialProgress(
                  porcentaje: (widget.porcenataje - difernciaAnimar) +
                      (difernciaAnimar * controller.value),
                  widget.colorPrimario,
                  widget.colorSecundario,
                  widget.grosorSecundario, 
                  widget.grosorPrimario)),
        );
      },
    );
  }
}

//*El dibujo del circulo y del arco
class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;
  _MiRadialProgress(this.colorPrimario, this.colorSecundario, this.grosorSecundario, this.grosorPrimario,
      {this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {
    //*Porcentaje con el que se va llenando el circulo

    //?Lapiz, el ancho, color y si es relleno o solo linea
    //*Circulo completado
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;
    final center = new Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //*Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
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
