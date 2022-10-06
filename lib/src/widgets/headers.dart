import 'package:flutter/material.dart';

//*La parte superior cuadrada, con bordes redondeados
//*Par al parte del custom paint toca extender custom paint
//*Genera dos metodos uno que es paint para colocar relleno tamaño curva ...
//* Geabrar metodos shouldRepaint y se retorna true
class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

//*Header diagonal
class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.purple;
    //*Relleno de color morado
    lapiz.style = PaintingStyle.fill;
    //*Borde su grosor
    lapiz.strokeWidth = 2;

    final path = new Path();
    //*Desde donde jasta donde trazar la ralla
    //* (ancho, alto)
    //*Comeinza desde 0 de anocho y a 0.35 de alto

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//*Triangulo en la pantalla
class HeaderTraingular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.purple;
    //*Relleno de color morado
    lapiz.style = PaintingStyle.fill;
    //*Borde su grosor
    lapiz.strokeWidth = 2;

    final path = new Path();
    //*Desde donde jasta donde trazar la ralla
    //* (ancho, alto)
    //*Comeinza desde 0 de anocho y 0 alto

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//*Triangulo parte de arriba en la pantalla
class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.purple;
    //*Relleno de color morado
    lapiz.style = PaintingStyle.fill;
    //*Borde su grosor
    lapiz.strokeWidth = 2;

    final path = new Path();
    //*Desde donde jasta donde trazar la ralla
    //* (ancho, alto)
    //*Comeinza desde 0 de anocho y 0 alto
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//*Curvo
class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.purple;
    //*Relleno de color morado
    lapiz.style = PaintingStyle.fill;
    //*Borde su grosor
    lapiz.strokeWidth = 2;

    final path = new Path();
    //*Desde donde jasta donde trazar la ralla
    //* (ancho, alto)
    path.lineTo(0, size.height * 0.25);
    //*Para la curvatura
    //*Los primeros dos valso es el angulo de curvatura
    //*Es decir por donde pasa la linea
    //*El punto del medio
    //*Los ultimos dos valos es donde termina la curva
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.30, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//*Curvo arriba
class HeaderDobleCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDobleCurvaPainter(),
      ),
    );
  }
}

class _HeaderDobleCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.purple;
    //*Relleno de color morado
    lapiz.style = PaintingStyle.fill;
    //*Borde su grosor
    lapiz.strokeWidth = 2;

    final path = new Path();
    //*Desde donde jasta donde trazar la ralla
    //* (ancho, alto)
    path.lineTo(0, size.height * 0.25);
    //*Para la curvatura
    //*Los primeros dos valso es el angulo de curvatura
    //*Es decir por donde pasa la linea
    //*El punto del medio
    //*Los ultimos dos valos es donde termina la curva
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//*Curvo abajo con gradiente
class HeaderDobleAbajoCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDobleAbajoCurvaPainter(),
      ),
    );
  }
}

class _HeaderDobleAbajoCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(60, 55.0), radius: 180);

    final Gradient gradiente = new LinearGradient(colors: <Color>[
      Color(0xff6D05E8),
      Color(0xffC012FF),
      Color(0xff6D05FA),
    ],
    stops: [
      0.2,
      0.5,
      1.0
    ]);
    final lapiz = Paint()..shader = gradiente.createShader(rect);
    //lapiz.color = Colors.purple;
    //*Relleno de color morado
    lapiz.style = PaintingStyle.fill;
    //*Borde su grosor
    lapiz.strokeWidth = 2;

    final path = new Path();
    //*Desde donde jasta donde trazar la ralla
    //* (ancho, alto)
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.70);
    //*Para la curvatura
    //*Los primeros dos valso es el angulo de curvatura
    //*Es decir por donde pasa la linea
    //*El punto del medio
    //*Los ultimos dos valos es donde termina la curva
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height * 0.80);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.60, size.width, size.height * 0.80);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
