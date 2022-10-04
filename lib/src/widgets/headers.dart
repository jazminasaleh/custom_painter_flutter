import 'package:flutter/material.dart';

//*La parte superior cuadrada, con bordes redondeados
class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: 300,
     decoration: BoxDecoration(
     color: Colors.purple,
      borderRadius: BorderRadius.only(
        bottomLeft:  Radius.circular(70),
        bottomRight: Radius.circular(70)
      )
     ),
      
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: 300,
     color: Colors.purple,
    );
  }
}