import 'package:flutter/material.dart';
import 'package:live_cargadores/screens/home.dart';
import 'package:live_cargadores/screens/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Time!',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => homeScreen(),
        '/menu': (context) => menuScreen(),
      },
    );
  }
}
