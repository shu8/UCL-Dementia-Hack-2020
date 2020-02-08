import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: TestCircle(
                    'Add Memories', Colors.purpleAccent, Colors.purple)),
            Align(
                alignment: Alignment.topRight,
                child: TestCircle(
                    'Calendar', Colors.lightBlueAccent, Colors.blue)),
            Align(
                alignment: Alignment.bottomLeft,
                child:
                    TestCircle('Rewind', Colors.yellowAccent, Colors.yellow)),
            Align(
                alignment: Alignment.bottomRight,
                child:
                    TestCircle('Activities', Colors.greenAccent, Colors.green))
          ],
        ));
  }
}

class TestCircle extends StatelessWidget {
  final String message;
  final Color baseColor;
  final Color splashColor;

  TestCircle(this.message, this.baseColor, this.splashColor);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: FlatButton(
                color: baseColor,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(65.5),
                splashColor: splashColor,
                onPressed: () {/* ... */},
                child: Text(message, style: TextStyle(fontSize: 20.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  // This widget is the root of your application.
  final String message;
  final Color color;

  Circle(this.message, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.0,
        height: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: color,
              elevation: 0,
              onPressed: () => {},
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0), child: Text(message))
          ],
        ));
  }
}
