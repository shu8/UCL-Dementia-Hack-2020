import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Circle('Add Mems', Colors.purpleAccent)
            ),
            Align(
              alignment: Alignment.topRight,
              child: Circle('Calendar', Colors.lightBlueAccent)
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Circle('Rewind', Colors.yellowAccent)
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Circle('Activity', Colors.greenAccent)
            )
          ],
        )
    );
  }
}

class Circle extends StatelessWidget {
  // This widget is the root of your application.
  String message;
  Color color;

  Circle(this.message, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform.scale(
            scale: 2.5,
            child: FloatingActionButton(
              backgroundColor: color,
              elevation: 0,
              onPressed: () => {},
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(message)
          )
        ],
      )
    );
  }
}