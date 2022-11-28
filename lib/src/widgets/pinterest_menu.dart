import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  

  PinterestButton({required this.onPressed, required this.icon});
}

//*Se crea cada uno de los botones
class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color activarColor;
  final Color backgroundColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  const PinterestMenu(
      {super.key,
      this.mostrar = true,
      this.activarColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.inactiveColor = Colors.blueGrey,
      required this.items
      });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          opacity: (mostrar) ? 1 : 0,
          child: Builder(builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activarColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          })),
    );
  }
}

//*Estilo de los botones del menu
class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          //*La parte de la sombra
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length,
            (index) =>
                _PinterestMenuButton(index: index, item: menuItems[index])));
  }
}

//*El evento de cada uno de los botones
class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

//*Povider
class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;
  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
