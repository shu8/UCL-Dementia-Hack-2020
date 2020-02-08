import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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

// TODO persistently store this
const ONBOARDING_COMPLETE = false;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rewind',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF00008B, color),
      ),
      home: ONBOARDING_COMPLETE ? HomePage() : OnboardingPage(title: 'Rewind'),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, 0.0),
              child: Text('Welcome!',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
            Transform.scale(
                scale: 5,
                child: FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  elevation: 0,
                  onPressed: () => {},
                  child: Text('Start'),
                )),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage() : super();

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HOME'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HOME',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
