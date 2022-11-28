import 'package:diseno/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    //*Toma todo el tamaño de la pantlal del dispostivi

    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
          //*Stack: para poder colocra un widget encima de otro
          body: Stack(
        children: [
          PinterestGrid(),
          //*Poder posicionar el meno en el centro de la parte de abajo
          _PinterestMenuLocation(),
        ],
      )),
    );
  }
}

//*Posicion de donde se va a colocar el menu
class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
        bottom: 30,
        child: Container(
          height: 50,
          width: width,
          child: Align(
            child: PinterestMenu(
              mostrar: mostrar, 
              activarColor: Colors.black, 
              backgroundColor: Colors.white, 
              inactiveColor: Colors.blueGrey, 
              items: [PinterestButton(
              icon: Icons.pie_chart,
              onPressed: () {
                print('Icon pie_chart');
              }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print('Icon seacrh');
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print('Icon notification ');
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('Icon supervised');
        }),]
              
            ),
          ),
        ));
  }
}

//*Los cuadros de fondo, que se vea igual a pinterresst
class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset >150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

//*El color y el numero de cada cuadro
class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;
  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
