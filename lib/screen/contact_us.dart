import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => new _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  static final TextEditingController _query = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Contact HR"),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Container(
                height: 10.0,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        decoration: new BoxDecoration(color: Colors.blue),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        decoration: new BoxDecoration(color: Colors.green),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        decoration: new BoxDecoration(color: Colors.red),
                      ),
                    ),
                  ],
                )),
            new Text("Write Down your Query",
                style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal)),
            new TextField(
              keyboardType: TextInputType.multiline,
              controller: _query,
              maxLines: 15,
            ),
            new Container(
              margin:
                  new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: new RaisedButton(
                onPressed: () {
                  Firestore.instance
                      .collection('hr_query')
                      .document()
                      .setData({'query': _query.text, 'user': 'Raghav Taneja'});
                  setState(() {
                    _query.clear();
                  });
                  Navigator.of(context).pop();
                },
                child: new Text(
                  "Send",
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
