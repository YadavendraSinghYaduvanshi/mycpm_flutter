import 'package:flutter/material.dart';

class Form_Card extends StatelessWidget {

  Form_Card({this.name, this.image, this.time});

  final Widget name;
  final Widget image;
  final Widget time;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.only(bottom: 1.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              image,
              new Column(
                children: <Widget>[
                  this.name,
                  this.time,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}