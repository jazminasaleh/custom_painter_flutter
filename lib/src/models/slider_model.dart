import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;
  double get currentPage => this._currentPage;

//*Cada vez que se obtiene el valor de la pagina actal
//*Se necesita notificar a los widgets que necesiten esta informacion
  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }
}
