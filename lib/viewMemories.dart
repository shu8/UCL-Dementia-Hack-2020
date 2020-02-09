import 'package:dementia_hack/Memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class viewMemories {
  final Memory yourMemory;
  final String mood;
  final bool textEntered;

  viewMemories({Key key, this.mood, this.textEntered, this.yourMemory})
      : super();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View memories'),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text('${selectedDate.toLocal()}'.split(' ')[0]),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                )
              ]))
        ])));
  }
}
