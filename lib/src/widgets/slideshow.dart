import 'package:flutter/material.dart';

import '../models/slider_model.dart';
import 'package:provider/provider.dart';

class SlidesShow extends StatelessWidget {
  final List<Widget> slides;

  SlidesShow({required this.slides});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new SliderModel(),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: 300,
              child: _Slides(
                slides: this.slides,
              ),
            ),
            _Dots(
              totalSlides: slides.length,
            )
          ],
        ),
      ),
    );
  }
}

//*Todos los puntos
class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots({super.key, required this.totalSlides});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //*Para la cantidad de puntos que van a parecer en la parte de abajo
        children: List.generate(this.totalSlides, (i) => _Dot(index: i))
      ),
    );
  }
}

//*Un solo punto
class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          //*Para qie vaya cambiando de color
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? Colors.blue
              : Colors.grey,

          //*Sea circulos
          shape: BoxShape.circle),
    );
  }
}

//*Slide de imagenes
class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides({required this.slides});
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  //*Para poder escuchar el cambio de la pagina
  //*Cada vez que se dispara este se actauliza el provider
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      print('Page actaul ${pageViewController.page}');
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
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
        /*children: const [
         
        ],*/
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}
