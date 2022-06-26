import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:interactive-canvas/icanvas.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ICanvas Test",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ICanvas Test"),
      ),
      body: SafeArea(
        child: Container(
          child: ICanvas(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blueAccent,
              child: CircleAvatar(),
            ),
          ),
        ),
      ),
    );
  }
}
