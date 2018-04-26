import 'package:flutter/material.dart';
import 'package:mycpm_flutter/utils/Group_Card.dart';
class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

      appBar: new AppBar(title: new Text("Groups"),),
      backgroundColor: Colors.grey,
      body: new ListView(
          children: <Widget>[
            new Group_Card(
              title: new Text("General - HR", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
              image: new CircleAvatar(
                backgroundImage: new AssetImage(
                    'assets/hr.png'),
                radius: 30.0,
              ),
              time: new Text("12:40", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
            ),
            new Group_Card(
              title: new Text("General - Accounts", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
              image: new CircleAvatar(
                backgroundImage: new AssetImage(
                    'assets/finance.png'),
                radius: 30.0,
              ),
              time: new Text("11:20", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
            ),
            new Group_Card(
              title: new Text("CPM", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
              image: new CircleAvatar(
                backgroundImage: new AssetImage(
                    'assets/carporate.jpg'),
                radius: 30.0,
              ),
              time: new Text("09:10", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
            ),
            new Group_Card(
              title: new Text("GSK - MT Supervisor", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
              image: new CircleAvatar(
                backgroundImage: new AssetImage(
                    'assets/hr.png'),
                radius: 30.0,
              ),
              time: new Text("08:57", style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),),
            ),
          ],
      ),
    );
  }

}