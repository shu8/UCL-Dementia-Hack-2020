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

  getMedia() {
    if (this.memory.media == null) return Text(' ');
    return Column(children: <Widget>[
      ...this.memory.media.map((m) => Image.file(File(m)))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate =
        DateTime.fromMillisecondsSinceEpoch(this.memory.timestamp);

    print('viewing memory media: ${this.memory.media}');
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
          getMedia(),
        ]));
  }
}
