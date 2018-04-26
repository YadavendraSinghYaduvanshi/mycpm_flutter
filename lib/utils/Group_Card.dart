import 'package:flutter/material.dart';

class Group_Card extends StatelessWidget {

  Group_Card({this.title, this.image, this.time});

  final Widget title;
  final Widget image;
  final Widget time;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.only(bottom: 3.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Row(
            children: <Widget>[
              this.image,
              new SizedBox(width: 20.0),
              new Column(
                children: <Widget>[
                  this.title,
                  new SizedBox(height: 10.0),
                  this.time
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}