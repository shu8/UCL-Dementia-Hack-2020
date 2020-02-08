import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memories',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Memories'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    height: 50.0,
                    child: Text(
                      "How are you feeling?",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        color: Colors.transparent,
                        height: 50.0,
                        child: (Row(
                          children: <Widget>[
                            Icon(
                              Icons.mood_bad,
                              color: Colors.red,
                              size: 36.0,
                              semanticLabel: 'very bad',
                            ),
                            Icon(
                              Icons.mood_bad,
                              color: Colors.orange,
                              size: 36.0,
                              semanticLabel: 'pretty bad',
                            ),
                            Icon(
                              Icons.mood,
                              color: Colors.yellow,
                              size: 36.0,
                              semanticLabel: 'pretty good',
                            ),
                            Icon(
                              Icons.mood,
                              color: Colors.green,
                              size: 36.0,
                              semanticLabel: 'very good',
                            ),
                          ],
                        )))),
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  height: 50.0,
                  child: Text(
                    "Add photo:",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      color: Colors.transparent,
                      height: 50.0,
                      child: (Icon(
                        Icons.camera,
                        color: Colors.black,
                        size: 50.0,
                        semanticLabel: 'add photo',
                      ))))
            ]),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  height: 50.0,
                  child: Text(
                    "Add video:",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      color: Colors.transparent,
                      height: 50.0,
                      child: (Icon(
                        Icons.camera_roll,
                        color: Colors.black,
                        size: 50.0,
                        semanticLabel: 'add video',
                      ))))
            ]),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  height: 50.0,
                  child: Text(
                    "Add audio:",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      color: Colors.transparent,
                      height: 50.0,
                      child: (Icon(
                        Icons.hearing,
                        color: Colors.black,
                        size: 50.0,
                        semanticLabel: 'add audio',
                      ))))
            ])
          ],
        ),
      ),
    );
  }
}
