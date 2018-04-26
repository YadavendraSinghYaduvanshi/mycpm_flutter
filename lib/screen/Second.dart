import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycpm_flutter/utils/Card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*class MyCard extends StatelessWidget {

  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.only(bottom: 10.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new RaisedButton(child: new Text("Next"),onPressed: (){Navigator.of(context).pushNamed('/Login');})
            ],
          ),
        ),
      ),
    );
  }
}*/


void _sendMessage({ String text }) {
  Firestore.instance.collection('books').document()
      .setData({ 'title': 'title', 'author': 'author' });

}

  class Second extends StatelessWidget {

  static BuildContext context_global;

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


  static Text home = new Text("Home", style: new TextStyle(
      color: Colors.blue,
      fontSize: 20.0,
      fontStyle: FontStyle.normal));

  static final home_parent = new GestureDetector(
      onTap: () {
        print("Home clicked");
        Navigator.of(context_global).pushNamed('/DataImage');
      },
      child: new Container(
        child: new Row(
            children: <Widget>[
              new Image(image: new AssetImage('assets/ic_home_black_48dp.png',),
                height: 30.0,
                width: 30.0,),
              new SizedBox(width: 10.0),
              home
            ]
        ),
      )
  );

  static Text groups = new Text("Groups", style: new TextStyle(
      color: Colors.blue,
      fontSize: 20.0,
      fontStyle: FontStyle.normal));

  static final groups_parent = new GestureDetector(
      onTap: () {
        print("Groups clicked");
        Navigator.of(context_global).pushNamed('/Groups');
      },
      child: new Container(
        child: new Row(
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/ic_group_black_48dp.png'),
                height: 30.0,
                width: 30.0,),
              new SizedBox(width: 10.0),
              groups
            ]
        ),
      )
  );

  static Text profile_txt = new Text("Profile", style: new TextStyle(
      color: Colors.blue,
      fontSize: 20.0,
      fontStyle: FontStyle.normal));

  static final profile_parent = new GestureDetector(
      onTap: () {
        print("Profile clicked");
        Navigator.of(context_global).pushNamed('/Profile');
      },
      child: new Container(
        child: new Row(
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/ic_person_black_48dp.png'),
                height: 30.0,
                width: 30.0,),
              new SizedBox(width: 10.0),
              profile_txt
            ]
        ),
      )
  );


  static Text sections = new Text("Sections", style: new TextStyle(
      color: Colors.blue,
      fontSize: 20.0,
      fontStyle: FontStyle.normal));

  static final sections_parent = new GestureDetector(
      onTap: () {
        print("Sections clicked");
        Navigator.of(context_global).pushNamed('/DataTest');
      },
      child: new Container(
        child: new Row(
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/ic_class_black_48dp.png'),
                height: 30.0,
                width: 30.0,),
              new SizedBox(width: 10.0),
              sections
            ]
        ),
      )
  );


  static Text exit = new Text("Exit", style: new TextStyle(
      color: Colors.blue,
      fontSize: 20.0,
      fontStyle: FontStyle.normal));

  static final exit_parent = new GestureDetector(
      onTap: () {
        print("Exit clicked");
        Navigator.of(context_global).pop();
      },
      child: new Container(
        child: new Row(
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/ic_exit_to_app_black_48dp.png'),
                height: 30.0,
                width: 30.0,),
              new SizedBox(width: 10.0),
              exit
            ]
        ),
      )
  );


  static var pad = const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0);
  static Padding padding2 = new Padding(padding: pad, child: home_parent,);
  static Padding padding3 = new Padding(padding: pad, child: groups_parent,);
  static Padding padding4 = new Padding(padding: pad, child: profile_parent,);
  static Padding padding5 = new Padding(padding: pad, child: sections_parent,);
  static Padding padding6 = new Padding(padding: pad, child: exit_parent,);

  static var children = [
    profile, padding2, padding3, padding4, padding5, padding6];
  static ListView listview = new ListView(children: children);
  Drawer drawer = new Drawer(child: listview,);

  @override
  Widget build(BuildContext context) {
    context_global = context;
    final title = 'MY - CPM';

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: new Scaffold(
          backgroundColor: Colors.white,
          drawer: drawer,
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 5.0),
                height: 100.0,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, right: 5.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage(
                            'assets/carporate.jpg'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage(
                            'assets/news.png'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage(
                            'assets/hr.png'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage(
                            'assets/finance.png'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage(
                            'assets/cpm_10th_year_celebration.png'),
                        radius: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              new MyCard(
                title: new Text("Team CPM event", style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic),),
                image: new Image(
                    image: new AssetImage('assets/image_fashion.jpg'),
                    height: 200.0),
              ),
              new MyCard(
                title: new Text(
                  "Music concert event", style: new TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic),),
                image: new Image(
                  image: new AssetImage('assets/event1.jpg'),
                  height: 200.0,
                ),
              ),
              new MyCard(
                title: new Text("Welcome here", style: new TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic),),
                image: new Image(
                  image: new AssetImage('assets/event2.jpg'),
                  height: 200.0,
                ),),
            ],
          )
      ),
    );
  }

}