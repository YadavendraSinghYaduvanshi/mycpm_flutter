import 'package:flutter/material.dart';

class HumanResources extends StatefulWidget {
  @override
  _HumanResourcesState createState() => new _HumanResourcesState();
}

class _HumanResourcesState extends State<HumanResources> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Human Resources"),
      ),
      body: new Container(
        child: new Column(
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
            new Expanded(child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new GestureDetector(
                    onTap: (){Navigator.of(context).pushNamed('/Forms');},
                    child: new Container(
                        margin: const EdgeInsets.only(
                            top: 2.0, bottom: 2.0, right: 5.0),
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage:
                              new AssetImage('assets/forms.jpg'),
                              radius: 60.0,
                            ),
                            new Text("Forms",
                                style: new TextStyle(
                                    color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal))
                          ],
                        )
                    ),
                  ),
                ),
                new Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, right: 5.0),
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundImage:
                            new AssetImage('assets/forms.jpg'),
                            radius: 60.0,
                          ),
                          new Text("My Documents",
                              style: new TextStyle(
                                  color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal))
                        ],
                      )
                  ),
                ),
              ],
            ),),
            new Expanded(child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new GestureDetector(
                    onTap: (){Navigator.of(context).pushNamed('/PaySlipList');},
                    child: new Container(
                        margin: const EdgeInsets.only(
                            top: 2.0, bottom: 2.0, right: 5.0),
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage:
                              new AssetImage('assets/forms.jpg'),
                              radius: 60.0,
                            ),
                            new Text("Payslip",
                                style: new TextStyle(
                                    color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal))
                          ],
                        )
                    ),
                  ),
                ),
                new Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, right: 5.0),
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundImage:
                            new AssetImage('assets/forms.jpg'),
                            radius: 60.0,
                          ),
                          new Text("Contact Us",
                              style: new TextStyle(
                                  color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal))
                        ],
                      )
                  ),
                ),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
