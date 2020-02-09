import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';

class SocializingPage extends StatelessWidget {
  SocializingPage() : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Socializing"),
          backgroundColor: Colors.blue[600],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Panel(
                    title: 'Pasta',
                    height: 160,
                    icon: Icons.fastfood,
                    description: "Make some pasta today! Here's the recipe!!",
                    color: Colors.blue[300],
                    clickHandler: () => {})),
            Align(
                alignment: Alignment.topRight,
                child: Panel(
                    title: 'Chicken',
                    height: 160,
                    icon: Icons.fastfood,
                    description: "Make some chicken today! Here's the recipe!!",
                    color: Colors.blue[400],
                    clickHandler: () => {})),
            Align(
                alignment: Alignment.bottomLeft,
                child: Panel(
                    title: 'Grilled cheese',
                    height: 160,
                    icon: Icons.fastfood,
                    description:
                        "Make some grilled cheese today! Here's the recipe!!",
                    color: Colors.blue[500],
                    clickHandler: () => {})),
            Align(
                alignment: Alignment.bottomRight,
                child: Panel(
                    title: 'Pizza',
                    height: 160,
                    icon: Icons.fastfood,
                    description: "Make some pizza today! Here's the recipe!!",
                    color: Colors.blue[600],
                    clickHandler: () => {})),
          ],
        )));
  }
}
