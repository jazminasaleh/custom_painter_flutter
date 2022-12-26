import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//*Cda uno de los containers o botones
class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;
  const BotonGordo({
    super.key, 
    this.icon = FontAwesomeIcons.circle, 
    required this.texto, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey, 
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress(),
      child: Stack(
        children: [
          _BotonGordoBackground(icon: icon,color1: color1, color2: color2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox( height: 140, width: 40 ),
              FaIcon( this.icon, color: Colors.white, size: 40 ),
              SizedBox( width: 20 ),
              Expanded(child: Text( this.texto, style: TextStyle( color: Colors.white, fontSize: 18 ) )),
              FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white.withOpacity(0.8) ),
              SizedBox( width: 40 ),
            ],
          )
        ],
      ),
    );
  }
}

//*Lo que hay en el container
class _BotonGordoBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground({
    Key? key, required this.icon, required this.color1, required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //*Para que el icono tambien quede redondeado y no se slaga del container
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(this.icon, size: 150, color: Colors.white.withOpacity(0.2)))
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        //*sombra en el container
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4,6), blurRadius:10 ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1,
            color2
          ])
      ),
    );
  }
}