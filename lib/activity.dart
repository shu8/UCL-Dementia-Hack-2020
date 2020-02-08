import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activities Suggester',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyActivityPage(title: 'Activities Suggester'),
    );
  }
}

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

class MyActivityPage extends StatefulWidget {
  MyActivityPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyActivityPageState createState() => _MyActivityPageState();
}

class _MyActivityPageState extends State<MyActivityPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          new ActivityBlock(
              title: 'Reading', color: MaterialColor(0xFFBA55D3, color)),
          new ActivityBlock(
              title: 'Cooking', color: MaterialColor(0xFFFF7F50, color))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

  // Center is a layout widget. It takes a single child and positions it
  // in the middle of the parent.
  // reading
  // arts and crafts
  // socializing
  // exersise
  // reading

}
