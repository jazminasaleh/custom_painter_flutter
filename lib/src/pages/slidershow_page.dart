import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderShowPage extends StatelessWidget {
  const SliderShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: 300,
              child: _Slides(),
            ),
            _Dots()
          ],
        ),
      ),
    );
  }
}

//*Todos los puntos
class _Dots extends StatelessWidget {
  const _Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(index: 0,),
          _Dot(index: 1,),
          _Dot(index: 2,),
        ],
      ),
    );
  }
}

//*Un solo punto
class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.grey,
          //*Sea circulos
          shape: BoxShape.circle),
    );
  }
}

//*Slide de imagenes
class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  //*Para poder escuchar el cambio de la pagina
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      print('Page actaul ${pageViewController.page}');
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      //*Es para poder deslizar las iamgenes
      child: PageView(
        //*Control del cambio de paginas
        controller: pageViewController,
        children: const [
          _Slide(
            svg: 'assets/slide-1.svg',
          ),
          _Slide(
            svg: 'assets/slide-2.svg',
          ),
          _Slide(
            svg: 'assets/slide-3.svg',
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({super.key, required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
