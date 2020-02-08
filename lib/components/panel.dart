import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Function clickHandler;

  Panel(
      {Key key,
      this.title,
      this.description,
      this.icon,
      this.color,
      this.clickHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () => this.clickHandler(),
        child: new Container(
          height: 100.0,
          margin: new EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            color: this.color,
          ),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(
                  padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Icon(this.icon)),
              new Expanded(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(
                    this.title,
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(
                    this.description,
                    style: new TextStyle(fontSize: 12.0, color: Colors.white70),
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}