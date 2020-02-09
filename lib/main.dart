import 'package:flutter/material.dart';
import 'package:dementia_hack/Database.dart';

import 'package:dementia_hack/common.dart';
import 'package:dementia_hack/home.dart';

import 'package:flutter/services.dart';

import 'Database.dart';

// TODO persistently store this
const ONBOARDING_COMPLETE = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // Root of application
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Rewind',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF00008B, color),
      ),
      home: ONBOARDING_COMPLETE ? HomePage() : OnboardingPage(title: 'Rewind'),
      // home: ActivityPage(),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext ctxt) {
    print(DBProvider.db.getAllMemories());
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
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
                  onPressed: () => {
                    Navigator.push(
                        ctxt,
                        new MaterialPageRoute(
                          builder: (ctxt) => HomePage(),
                        ))
                  },
                  child: Text('Start'),
                )),
          ],
        ),
      ),
    );
  }
}
