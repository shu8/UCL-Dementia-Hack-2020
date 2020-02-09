import 'package:dementia_hack/activities/arts.dart';
import 'package:dementia_hack/activities/cooking.dart';
import 'package:dementia_hack/activities/exercise.dart';
import 'package:dementia_hack/activities/socializing.dart';
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
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                      title: 'Exercise',
                      height: 160,
                      icon: Icons.directions_run,
                      description: '',
                      color: Colors.green,
                      clickHandler: () =>
                          moveScreen(context, () => ExercisePage()))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                      title: 'Cooking',
                      height: 160,
                      icon: Icons.fastfood,
                      description: '',
                      color: Colors.orange,
                      clickHandler: () =>
                          moveScreen(context, () => CookingPage()))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                      title: 'Arts and Crafts',
                      height: 160,
                      icon: Icons.local_activity,
                      description: '',
                      color: Colors.red[200],
                      clickHandler: () =>
                          moveScreen(context, () => ArtsPage()))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                      title: 'Socializing',
                      height: 160,
                      icon: Icons.people,
                      description: '',
                      color: Colors.blue[300],
                      clickHandler: () =>
                          moveScreen(context, () => SocializingPage()))),
            ],
          ),
        ));
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
