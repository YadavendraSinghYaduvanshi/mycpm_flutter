import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class Login extends StatelessWidget {
  static final TextEditingController _uid = new TextEditingController();
  static final TextEditingController _psw = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: new Color(0xffEEEEEE),
        appBar: new AppBar(
          title: new Text("Login"),
          backgroundColor: Colors.blue,
        ),
        body: new Center(
            child: new ListView(shrinkWrap: true, children: <Widget>[
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 20.0),
            child: new Center(
              child: new Image(
                image: new AssetImage('assets/cpm_10th_year_celebration.png'),
                height: 150.0,
                width: 150.0,
              ),
            ),
          ),
          new SizedBox(height: 24.0),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: 200.0,
            child: new Center(
              child: new Form(
                  child: new Card(
                child: new Container(
                  padding: new EdgeInsets.all(15.0),
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        controller: _uid,
                        decoration:
                            new InputDecoration(hintText: "Enter User Id"),
                        validator: (val) =>
                        val.length < 1 ? 'Please enter User Id.' : null,
                      ),
                      new TextFormField(
                        controller: _psw,
                        decoration:
                            new InputDecoration(hintText: "Enter Password"),
                        obscureText: true,
                        validator: (val) =>
                        val.length < 1 ? 'Please enter password.' : null,
                      ),
                      new Container(
                        margin: new EdgeInsets.symmetric(vertical: 10.0),
                        child: new RaisedButton(
                            child: new Text("Submit"),
                            onPressed: () {
                              //Navigator.of(context).pushNamed('/Second');
                              _onLoading(context);
                            }),
                      )
                    ],
                  ),
                ),
              )),
            ),
          ),
          new SizedBox(height: 24.0),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            child: new Center(
              child: new Text("(c) All rights reserved 2018"),
            ),
          ),
        ])));
  }

  void onSubmit() {
    print("Login with: " + _uid.text + " " + _psw.text);
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new Dialog(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
            new Text("Loading"),
          ],
        ),
      ),
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
      Navigator.of(context).pushNamed('/MainPage');
    });
  }
}
