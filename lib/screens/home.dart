import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:live_cargadores/screens/homeScreens/mapScreen.dart';

List<Widget> homeScreens = <Widget>[mapScreen(), Text("Prueba"), Text("Si")];

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen> {
  int indexScreen = 0;

  void onItemTapped(int index) {
    setState(() {
      indexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cargadores LIVE"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              })
        ],
      ),
      body: Center(
        child: homeScreens.elementAt(indexScreen),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Rutas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Historial'),
        ],
        currentIndex: indexScreen,
        onTap: onItemTapped,
      ),
    );
  }
}
