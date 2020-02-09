import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';

class ArtsPage extends StatelessWidget {
  ArtsPage() : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Arts and Crafts"),
          backgroundColor: Colors.red[600],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Panel(
                    title: 'Origami ',
                    height: 160,
                    icon: Icons.crop_original,
                    description: "Take an origami class!!",
                    color: Colors.red[200],
                    clickHandler: () => {})),
            Align(
                alignment: Alignment.topRight,
                child: Panel(
                    title: 'Painting',
                    height: 160,
                    icon: Icons.format_paint,
                    description: "Spend the day learning how to paint!!",
                    color: Colors.red[300],
                    clickHandler: () => {})),
            Align(
                alignment: Alignment.bottomLeft,
                child: Panel(
                    title: 'Jewelry',
                    height: 160,
                    icon: Icons.art_track,
                    description: "Spend the day learning how to make jewelry!!",
                    color: Colors.red[400],
                    clickHandler: () => {})),
            Align(
                alignment: Alignment.bottomRight,
                child: Panel(
                    title: 'Candles',
                    height: 160,
                    icon: Icons.lightbulb_outline,
                    description: "Spend the day learning how to make candels!!",
                    color: Colors.red[500],
                    clickHandler: () => {})),
          ],
        )));
  }
}
