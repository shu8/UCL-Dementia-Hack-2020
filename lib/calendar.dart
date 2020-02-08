import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
          title: Text('Flutter Calendar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar(
                calendarStyle: CalendarStyle(
                  todayColor: Colors.orangeAccent,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white
                  ),
                  highlightToday: true
                ),
                calendarController: _controller,
              )
            ],
          ),
        ),
      );
    }
  
    _CalendarPageState() {}
}