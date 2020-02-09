import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  ExercisePage() : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Exercises"),
          backgroundColor: Colors.green[600],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Panel(
                  title: 'Marthons',
                  height: 160,
                  icon: Icons.directions_run,
                  description: "If you're up for it...join the marthon!",
                  color: Colors.green[300],
                )),
            Align(
                alignment: Alignment.topRight,
                child: Panel(
                  title: 'Play tennis',
                  height: 160,
                  icon: Icons.directions_run,
                  description: 'Play in nearby tennis courts',
                  color: Colors.green[400],
                )),
            Align(
                alignment: Alignment.bottomLeft,
                child: Panel(
                  title: 'Take a walk ',
                  height: 160,
                  icon: Icons.directions_walk,
                  description: 'Go on a 15 min walk in the park!',
                  color: Colors.green[500],
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Panel(
                  title: 'Water Polo',
                  height: 160,
                  icon: Icons.pool,
                  description: "Participate in today's water polo class!",
                  color: Colors.green[600],
                )),
          ],
        )));
  }
}
