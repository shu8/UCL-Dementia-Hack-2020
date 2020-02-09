import 'package:dementia_hack/calendar.dart';
import 'package:dementia_hack/memoriesInitial.dart';
import 'package:dementia_hack/quiz.dart';
import 'package:flutter/material.dart';
import 'package:dementia_hack/common.dart';
import 'package:dementia_hack/activity.dart';
import 'package:dementia_hack/components/panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rewind'),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Panel(
                  title: 'Add memories',
                  height: 160,
                  icon: Icons.add_a_photo,
                  description: 'Add a memory for today',
                  color: Colors.purple,
                  clickHandler: () =>
                      moveScreen(ctxt, () => MemoriesInitialPage()),
                )),
            Align(
                alignment: Alignment.topRight,
                child: Panel(
                  title: 'Calendar',
                  height: 160,
                  icon: Icons.calendar_today,
                  description: 'View your moods over time',
                  color: Colors.blue,
                  clickHandler: () => moveScreen(ctxt, () => CalendarPage()),
                )),
            Align(
                alignment: Alignment.bottomLeft,
                child: Panel(
                  title: 'Rewind',
                  height: 160,
                  icon: Icons.question_answer,
                  description: 'Answer questions on your past',
                  color: Colors.deepOrange,
                  clickHandler: () => moveScreen(ctxt, () => Quiz()),
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Panel(
                  title: 'Activities',
                  height: 160,
                  icon: Icons.directions_run,
                  description: 'Choose an activity to do today!',
                  color: Colors.green,
                  clickHandler: () => moveScreen(ctxt, () => ActivityPage()),
                )),
          ],
        )));
  }
}
