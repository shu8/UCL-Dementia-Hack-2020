import 'dart:math';

import 'package:dementia_hack/Database.dart';
import 'package:dementia_hack/common.dart';
import 'package:dementia_hack/viewMemory.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Memory.dart';
import 'Database.dart';
import 'components/panel.dart';

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
            numOfMemForDay = getMemoryMap(memories);
          })
        });

    _controller = CalendarController();
  }

  Map<String, int> getMemoryMap(List<Memory> memories) {
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
            ...memories.map((memory) => Panel(
                  clickHandler: () =>
                      moveScreen(context, () => ViewMemory(memory: memory)),
                  title: mapTitle(memory.getCategory()),
                  height: 60,
                  icon: mapIcon(memory.getCategory()),
                  description: memory.getText(),
                  color: mapColor(memory.getCategory()),
                ))

            /*
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
                )) */
          ],
        ),
      ),
    );
  }

  String mapTitle(int category) {
    switch (category) {
      case 0:
        {
          return "General";
        }
      case 1:
        {
          return "Exercise";
        }
      case 2:
        {
          return "Cooking";
        }
      case 3:
        {
          return "Arts and Crafts";
        }
      case 4:
        {
          return "Socializing";
        }
      default:
        {
          return "General";
        }
    }
  }

  IconData mapIcon(int category) {
    switch (category) {
      case 0:
        {
          return Icons.event;
        }
      case 1:
        {
          return Icons.directions_run;
        }
      case 2:
        {
          return Icons.fastfood;
        }
      case 3:
        {
          return Icons.local_activity;
        }
      case 4:
        {
          return Icons.people;
        }
      default:
        {
          return Icons.event;
        }
    }
  }

  Color mapColor(int category) {
    switch (category) {
      case 0:
        {
          return Colors.pink[300];
        }
      case 1:
        {
          return Colors.green;
        }
      case 2:
        {
          return Colors.orange;
        }
      case 3:
        {
          return Colors.red[200];
        }
      case 4:
        {
          return Colors.blue[300];
        }
      default:
        {
          return Colors.pink[300];
        }
    }
  }

  Color colorDay(DateTime day) {
    int green = min(255, 3 * 10);
    String ymd = day.toString().substring(0, day.toString().indexOf(' '));
    print("testing: $numOfMemForDay");
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
