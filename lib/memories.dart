import 'package:flutter/material.dart';

class MemoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Memories'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Center(
                  child: Text(
                'How are you feeling?',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Mood(
                icon: Icons.mood_bad,
                color: Colors.red,
                label: 'very bad',
              ),
              Mood(
                icon: Icons.sentiment_dissatisfied,
                color: Colors.orange,
                label: 'pretty bad',
              ),
              Mood(
                icon: Icons.sentiment_satisfied,
                color: Colors.yellow,
                label: 'pretty good',
              ),
              Mood(
                icon: Icons.mood,
                color: Colors.green,
                label: 'very good',
              ),
            ],
          ),
          AddX(type: 'photo', icon: Icons.camera),
          AddX(type: 'video', icon: Icons.camera_roll),
          AddX(type: 'audio', icon: Icons.hearing),
          TextInput(),
        ],
      ),
    );
  }
}

class Mood extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  Mood({this.icon, this.color, this.label}) : super();

  @override
  Widget build(BuildContext context) {
    return Icon(
      this.icon,
      color: this.color,
      size: 36.0,
      semanticLabel: this.label,
    );
  }
}

class AddX extends StatelessWidget {
  final String type;
  final IconData icon;

  AddX({this.type, this.icon}) : super();

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
          color: Colors.transparent,
          height: 50.0,
          child: Text(
            'Add ' + this.type + ':',
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
                this.icon,
                color: Colors.black,
                size: 50.0,
                semanticLabel: 'add ' + this.type,
              ))))
    ]);
  }
}

class TextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    child:
    Text(
      'Add text',
      style: TextStyle(
        fontSize: 22.0,
        color: Colors.black,
      ),
    );}
  Widget build(BuildContext context) {
    return new TextField(
      style: new TextStyle(
          fontSize: 42.0,
          color: const Color(0xFF000000),
          fontWeight: FontWeight.w200,
          fontFamily: "Roboto"),
    );
  }
}
