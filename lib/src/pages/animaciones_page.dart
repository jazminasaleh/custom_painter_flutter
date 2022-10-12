import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

//*se le hace la animacion al rectangulo
//*se le da la opacidad
class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;

  @override
  void initState() {
    //Controlador: es el que dice que avance retroceder y asi
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    // la rotacion comienza  a variar desde 0 hasta 2 en los 4000 segundo
    // lo de curves es el tipo de animacion
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi)
    //En que punto del tiempo se reproduce la animacion
        .animate(CurvedAnimation(parent: controller, curve: Interval(0 , 0.25, curve: Curves.easeOut)));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(controller);
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        //*Resetiar el valor de la opacidad
        controller.reset();
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play comienza la animacion
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      //*LLama al rectangulo
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.rotate(angle: rotacion.value, 
        child:Opacity(opacity: opacidad.value,
        child: childRectangulo,));
      },
    );
  }
}

//*Se le asigna color y tamaño al rectangulo
class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.green),
    );
  }
}
