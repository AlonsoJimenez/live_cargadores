import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class menuScreen extends StatefulWidget {
  @override
  State<menuScreen> createState() => menuScreenState();
}

class menuScreenState extends State<menuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
    );
  }
}
