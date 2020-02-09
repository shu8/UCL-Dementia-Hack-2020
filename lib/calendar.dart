import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Memory.dart';

//create array of memory objects

Memory test1 = Memory(
    category: 2, text: "Baked a cake today.", timestamp: 1234, media: []);
Memory test2 = Memory(
    category: 1, text: "Walked around the park.", timestamp: 1243, media: []);
Memory test3 = Memory(
    category: 3, text: "Knitted a nice scarf.", timestamp: 1324, media: []);
Memory test4 = Memory(
    category: 4,
    text: "Played around with nephews and nieces.",
    timestamp: 1342,
    media: []);

List<Memory> memories = [test1, test2, test3, test4];

var ok = ["cookies", "chocolate", "cake"];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(),
      // home: ONBOARDING_COMPLETE ? HomePage() : OnboardingPage(title: 'Rewind'),
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    String currentMonth;
    String yesyes;
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
                  selectedDayBuilder: (context, date, events) => Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(date.day.toString(),
                          style: TextStyle(color: Colors.white)))),

              calendarController: _controller, //actual calendar
            ),
            ...filterDay(memories).map((text) => ListTile(
                  title: Text(text),
                ))
          ],
        ),
      ),
    );
  }

  List<String> filterDay(List<Memory> memoryList) {
    //actually need to do the filtering now
    List<String> list = memoryList.map((memory) => memory.getText()).toList();
    return list;
  }

  _CalendarPageState();
}
