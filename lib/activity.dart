import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

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
              title: 'Reading', color: MaterialColor(0xFFBA55D3, color)),
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
              padding: EdgeInsets.all(80),
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
