import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';
import 'common.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activities"),
      ),
      body: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Exercise',
                icon: Icons.directions_run,
                description: '',
                color: Colors.green,
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Cooking',
                icon: Icons.fastfood,
                description: '',
                color: Colors.orange,
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Arts and Crafts',
                icon: Icons.local_activity,
                description: '',
                color: Colors.red[200],
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Panel(
                title: 'Socializing',
                icon: Icons.people,
                description: '',
                color: Colors.blue[300],
              )),
        ],
      ),
    );
  }
}

class ActivityBlock extends StatelessWidget {
  ActivityBlock({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Center(
      //   child: Align(
      // alignment: Alignment.topCenter,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: this.color,
              textColor: Colors.white,
              padding: EdgeInsets.all(50),
              splashColor: this.color,
              onPressed: () {/* ... */},
              child: Text(this.title, style: TextStyle(fontSize: 50.0)),
            ),
          ),
        ],
      ),
    );
  }
}
// Center is a layout widget. It takes a single child and positions it
// in the middle of the parent.

// arts and crafts
// socializing
// exersise
// reading
