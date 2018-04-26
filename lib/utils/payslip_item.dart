import 'package:flutter/material.dart';

class PayslipItem extends StatelessWidget {
  PayslipItem({this.name, this.value});

  final Widget name;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.only(bottom: 3.0),
      child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: this.name,
                  ),
                  new Expanded(
                    child: this.value,
                  ),
                ],
              ),
              new Container(
                height: 0.7,
                color: new Color(0xffBDBDBD),
                margin: const EdgeInsets.only(bottom: 10.0, top: 10.0,left: 5.0, right: 5.0),
              )
            ],
          )),
    );
  }
}
