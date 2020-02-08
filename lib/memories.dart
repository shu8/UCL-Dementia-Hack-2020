import 'package:dementia_hack/components/addPhoto.dart';
import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';
import 'common.dart';

class MemoriesPage extends StatelessWidget {
  MemoriesPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Activities"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Mood(
                    icon: Icon(Icons.mood_bad),
                    color: Colors.red,
                  ),
                  Mood(
                    icon: Icon(Icons.sentiment_dissatisfied),
                    color: Colors.orange,
                  ),
                  Mood(
                    icon: Icon(Icons.sentiment_satisfied),
                    color: Colors.yellow[600],
                  ),
                  Mood(
                    icon: Icon(Icons.mood),
                    color: Colors.green,
                  ),
                ],
              )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add Photos',
                    // height: 150.0,
                    icon: Icons.photo,
                    description: '',
                    color: Colors.green,
                    clickHandler: () => moveScreen(context, () => AddPhoto()),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add Video',
                    // height: 160.0,
                    icon: Icons.videocam,
                    description: '',
                    color: Colors.orange,
                    clickHandler: () => {print('TODO')}, // TODO moveScreen
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add Audio',
                    icon: Icons.keyboard_voice,
                    // height: 160.0,
                    description: '',
                    color: Colors.red[200],
                    clickHandler: () => {print('TODO')}, // TODO moveScreen
                  )),
            ],
          ),
        ));
  }
}

class Mood extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String label;

  Mood({this.icon, this.color, this.label}) : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: this.icon,
      color: this.color,
      iconSize: 60,
      onPressed: () {},
    );
  }
}
