import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  IconHeader({
    super.key,
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = const Color(0xff526BF6),
    this.color2 = const Color(0xff67ACF2),
  });
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
       _IconHeaderBackground(color1: color1,color2: color2),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              this.icon,
              size: 250,
              color: Colors.white.withOpacity(0.2),
            )),
        Column(
          children: [
            //*Con el width: double.infinity es el que centra todo
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              this.subtitulo,
              style: TextStyle(fontSize: 20, color: colorBlanco),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              this.titulo,
              style: TextStyle(
                  fontSize: 25,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            FaIcon(
              this.icon,
              size: 80,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
    Key? key, required this.color1, required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                this.color1,
                this.color2
              ])),
    );
  }
}
