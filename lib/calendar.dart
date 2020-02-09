import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Memory.dart';

//create array of memory objects

Memory test1 = Memory(text:"test", date:"1234", media:[]);
Memory test2 = Memory(text:"test2", date:"1243", media:[]);

var ok = ["ok", "cool", "cool"];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
      ),
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
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Flutter Calendar'),
        ),
        body: SingleChildScrollView(//scroll
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar( //calendar settings
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.pink,
                  selectedColor: Colors.lightBlueAccent,
                  todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white
                  ),
                  highlightToday: true
                ),
                headerStyle: HeaderStyle( //header (date stuff)
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white
                  ),
                  formatButtonShowsNext: false,
                ),
                //config
                startingDayOfWeek: StartingDayOfWeek.monday,
                //builders
                builders: CalendarBuilders(
                  //change the selected day look
                  todayDayBuilder: (context, date, events) => 
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text(
                      date.day.toString(), 
                      style: TextStyle(
                        color: Colors.white
                    ))
                  ),

                  selectedDayBuilder: (context, date, events) => 
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text(
                      date.day.toString(), 
                      style: TextStyle(
                        color: Colors.white
                    ))
                  )
                ),

                calendarController: _controller, //actual calendar
              ),
              ...ok.map((text) => ListTile(
                title: Text(text),
              ))
            ],
          ),
        ),
      );
    }
  
    _CalendarPageState() {}
}