import 'package:flutter/material.dart';
import 'common.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("activities"),
      ),
      body: Column(
        children: <Widget>[
          new ActivityBlock(
              title: 'Cooking', color: MaterialColor(0xFFFF7F50, color)),
          new ActivityBlock(
              title: 'Reading', color: MaterialColor(0xFFBA55D3, color)),
          new ActivityBlock(
              title: 'Exersise', color: MaterialColor(0xFF800000, color)),
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
              splashColor: Colors.blueAccent,
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
