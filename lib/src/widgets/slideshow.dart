import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SlidesShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double builtPrimario;
  final double builtSecundario;

  SlidesShow(
      {required this.slides,
      this.puntosArriba = false,
      required this.colorPrimario,
      required this.colorSecundario,
      required this.builtPrimario,
      required this.builtSecundario});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new _SlidesModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            //*Se le manda la infromacion obtenida por slidesshow
            Provider.of<_SlidesModel>(context, listen: false).colorPrimario =
                this.colorPrimario;
            Provider.of<_SlidesModel>(context, listen: false).colorSecundario =
                this.colorSecundario;
            Provider.of<_SlidesModel>(context, listen: false).bulletPrimario =
                this.builtPrimario;
            Provider.of<_SlidesModel>(context, listen: false).bulletSecundario =
                this.builtSecundario;
            return _CreateEstructuraSliders(
                puntosArriba: puntosArriba, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CreateEstructuraSliders extends StatelessWidget {
  const _CreateEstructuraSliders({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.puntosArriba)
          _Dots(
            totalSlides: slides.length,
          ),
        Expanded(
          child: _Slides(
            slides: this.slides,
          ),
        ),
        if (!this.puntosArriba) _Dots(totalSlides: slides.length),
      ],
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
          children: List.generate(this.totalSlides, (i) => _Dot(index: i))),
    );
  }
}

//*Un solo punto
class _Dot extends StatelessWidget {
  final int index;
  double tamano = 0;
  Color color = Colors.black;

  _Dot({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlidesModel>(context);
    if (ssModel._currentPage >= index - 0.5 &&
        ssModel._currentPage < index + 0.5) {
      tamano = ssModel._bullterPrimario;
      color = ssModel._colorPrimario;
    } else {
      tamano = ssModel._bulletSecundario;
      color = ssModel._colorSecundario;
    }
    return Container(
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          //*Para qie vaya cambiando de color
          color: color,

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
      Provider.of<_SlidesModel>(context, listen: false).currentPage =
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

//*Provider
//*Para que no se tenga que pasar infromacion por varias clases sino solo la necesaria
class _SlidesModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.black;
  double _bullterPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

//*Cada vez que se obtiene el valor de la pagina actal
//*Se necesita notificar a los widgets que necesiten esta informacion
  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bullterPrimario;
  set bulletPrimario(double bprimario) {
    this._bullterPrimario = bprimario;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bsecundario) {
    this._bulletSecundario = bsecundario;
  }
}
