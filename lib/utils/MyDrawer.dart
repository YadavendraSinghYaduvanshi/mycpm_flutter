import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{

  static var profile_name = "Raghav Taneja";

  static final profile = new Container(
    color: Colors.blue,
    height: 200.0,
    child: new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new AssetImage(
                'assets/profile_pic.png'),
            radius: 50.0,),
          new SizedBox(width: 10.0),
          new Text(profile_name, style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontStyle: FontStyle.normal)),
        ],
      ),
    ),
  );

  var header = new DrawerHeader(child: profile);

  static Text home = new Text("Home", style: new TextStyle(
      color: Colors.blue,
      fontSize: 20.0,
      fontStyle: FontStyle.normal));

  static var itemicon = new Image(image: new AssetImage('assets/ic_home_black_48dp.png',),
    height: 30.0,
    width: 30.0,);

 /* var draweritem = new ListTile(
    leading: new Icon(itemicon),
    title: new Text('Change history'),
    onTap: () {
      // change app state...
      Navigator.pop(context); // close the drawer
    },
  );
*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return new Drawer();
  }

}