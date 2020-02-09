import 'dart:io';

import 'package:dementia_hack/Memory.dart';
import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewMemory extends StatefulWidget {
  final Memory memory;
  ViewMemory({this.memory}) : super();

  @override
  _ViewMemoryState createState() => _ViewMemoryState(memory: this.memory);
}

class _ViewMemoryState extends State<ViewMemory> {
  final Memory memory;
  _ViewMemoryState({this.memory});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate =
        DateTime.fromMillisecondsSinceEpoch(this.memory.timestamp);

    List<String> media = this.memory.media == null ? this.memory.media : List();

    print('viewing memory: ${this.memory.toString()}');
    print('viewing memory: ${selectedDate.toLocal().toString().split(' ')[0]}');
    return Scaffold(
        appBar: AppBar(
          title: Text('Your memory'),
        ),
        body: Column(children: <Widget>[
          Panel(
            title: selectedDate.toLocal().toString().split(' ')[0],
            description: '',
            color: Colors.blue,
            height: 100,
          ),
          Text(
            memory.text,
            style: new TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          ...media.map((m) => Image.file(File(m))),
        ]));
  }
}
