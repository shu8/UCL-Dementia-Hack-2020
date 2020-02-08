import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rewind'),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Panel(
                  title: 'Add memories',
                  icon: Icons.add_a_photo,
                  description: 'Add a memory for today',
                  color: Colors.purple,
                )),
            Align(
                alignment: Alignment.topRight,
                child: Panel(
                  title: 'Calendar',
                  icon: Icons.calendar_today,
                  description: 'View your moods over time',
                  color: Colors.blue,
                )),
            Align(
                alignment: Alignment.bottomLeft,
                child: Panel(
                  title: 'Rewind',
                  icon: Icons.question_answer,
                  description: 'Answer questions on your past',
                  color: Colors.deepOrange,
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Panel(
                  title: 'Activities',
                  icon: Icons.directions_run,
                  description: 'Choose an activity to do today!',
                  color: Colors.green,
                )),
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
