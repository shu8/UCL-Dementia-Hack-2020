import 'dart:math';

import 'package:dementia_hack/Database.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Memory.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;
  Map<String, int> numOfMemForDay;
  List<Memory> memories;

  @override
  void initState() {
    super.initState();
    DBProvider.db.getAllMemories().then((memories) => {
          this.setState(() {
            this.memories = memories;
            numOfMemForDay = getInitialMap(memories);
          })
        });

    _controller = CalendarController();
  }

  Map<String, int> getInitialMap(List<Memory> memories) {
    Map<String, int> all = Map<String, int>();
    for (Memory memory in memories) {
      all.putIfAbsent(memory.getDate(), () => memory.getNumOfMemories());
    }
    print("OK : " + all.toString());
    return all;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Flutter Calendar'),
      ),
      body: SingleChildScrollView(
        //scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //calendar settings
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.pink,
                  selectedColor: Colors.lightBlueAccent,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white),
                  highlightToday: true),
              headerStyle: HeaderStyle(
                //header (date stuff)
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              //config,
              startingDayOfWeek: StartingDayOfWeek.monday,
              //builders
              builders: CalendarBuilders(
                //change the selected day look
                todayDayBuilder: (context, date, events) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(date.day.toString(),
                        style: TextStyle(color: Colors.white))),
                dayBuilder: (context, date, events) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: colorDay(date),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(date.day.toString(),
                        style: TextStyle(
                          color: colorText(date.day),
                        ))),
                selectedDayBuilder: (context, date, events) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(date.day.toString(),
                        style: TextStyle(
                          color: colorDay(date),
                        ))),
              ),
              calendarController: _controller, //actual calendar
            ),
            ...memories.map((memory) => ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(memory.getText()),
                ))
          ],
        ),
      ),
    );
  }

  Icon mapIcon(int category) {
    switch (category) {
      case 1:
        {
          return Icon(Icons.local_activity);
        }
    }
  }

  Color colorDay(DateTime day) {
    int green = min(255, 3 * 10);
    String ymd = day.toString().substring(0, day.toString().indexOf(' '));
    if (numOfMemForDay.containsKey(ymd)) {
      print("contains key!");
      int green = min(10 * numOfMemForDay[ymd], 255);
      print("green: $green");
      return Color.fromARGB(255, 255 - (green * 10), 255, 255 - (green * 10));
    }
    return Color.fromARGB(255, 255, 255, 255);
  }

  Color colorText(int numOfMemories) {
    int green = min(255, numOfMemories * 10);
    return Color.fromARGB(255, 0, 0, 0);
  }

  List<String> filterDay(List<Memory> memoryList) {
    //actually need to do the filtering now
    List<String> list = memoryList.map((memory) => memory.getText()).toList();
    return list;
  }

  _CalendarPageState();
}
