import 'package:animate_do/animate_do.dart';
import 'package:diseno/src/widgets/boton_gordo.dart';
import 'package:diseno/src/widgets/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

//*Tods los carts
class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items.map(
      //*FadeInRight para la animacion animated_do
      (item) => FadeInRight(
        duration: Duration(milliseconds: 1000),
        child: BotonGordo(
          texto: item.texto, 
          onPress: (){},
          icon: item.icon,
          color1: item.color1,
          color2: item.color2,
          ),
      )
    ).toList();
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          child: ListView(
            //*Para que cuando se bajen los container halla rebote
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 80,
              ),
              ...itemMap
              
            ],
          ),
        ),
        _Encabezado()
      ],
    ));
  }
}

//*La parte de arriba
class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
            icon: FontAwesomeIcons.plus,
            titulo: 'Asistencia medica',
            subtitulo: 'Haz solicitud'),

        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {  },
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            child: FaIcon(FontAwesomeIcons.ellipsisVertical , color: Colors.white,))
        ),
      ],
    );
  }
}

class BotonGordoTeam extends StatelessWidget {
  const BotonGordoTeam({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      texto: 'Motor Accident',
      onPress: () {
        print('Hola');
      },
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Agregar',
      titulo: 'Un inmueble',
    );
  }
}
