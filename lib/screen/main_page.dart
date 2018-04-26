import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycpm_flutter/utils/Card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
/*  Widget getDataFromserver() {
    List dataList ;
    var dataView = new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('images').snapshots,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        */ /*return new ListView(
          shrinkWrap: true,
          children: ,
        );*/ /*


        dataList = snapshot.data.documents.map((DocumentSnapshot document) {
          return new MyCard(
            title: new Text(document['file_name'],
                style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic)),
            image: new Image.network(document['path'], height: 200.0),
          );
        }).toList();

        var column = new Column();

        for (var i = 0; i < dataList.length; i++) {
          column.children.add(dataList.elementAt(i));
        }

        var container = new Container(
          child: column,
        );

        setState(() {});
        return container;
      },
    );


  }*/

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
            backgroundImage: new AssetImage('assets/profile_pic.png'),
            radius: 50.0,
          ),
          new SizedBox(width: 10.0),
          new Text(profile_name,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal)),
        ],
      ),
    ),
  );

  static Text home = new Text("Home",
      style: new TextStyle(
          color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal));

  static final home_parent = new GestureDetector(
      onTap: () {
        print("Home clicked");
        Navigator.of(context_global).pushNamed('/DataImage');
      },
      child: new Container(
        child: new Row(children: <Widget>[
          new Image(
            image: new AssetImage(
              'assets/ic_home_black_48dp.png',
            ),
            height: 30.0,
            width: 30.0,
          ),
          new SizedBox(width: 10.0),
          home
        ]),
      ));

  static Text groups = new Text("Groups",
      style: new TextStyle(
          color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal));

  static final groups_parent = new GestureDetector(
      onTap: () {
        print("Groups clicked");
        Navigator.of(context_global).pushNamed('/Groups');
      },
      child: new Container(
        child: new Row(children: <Widget>[
          new Image(
            image: new AssetImage('assets/ic_group_black_48dp.png'),
            height: 30.0,
            width: 30.0,
          ),
          new SizedBox(width: 10.0),
          groups
        ]),
      ));

  static Text profile_txt = new Text("Profile",
      style: new TextStyle(
          color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal));

  static final profile_parent = new GestureDetector(
      onTap: () {
        print("Profile clicked");
        Navigator.of(context_global).pushNamed('/Profile');
      },
      child: new Container(
        child: new Row(children: <Widget>[
          new Image(
            image: new AssetImage('assets/ic_person_black_48dp.png'),
            height: 30.0,
            width: 30.0,
          ),
          new SizedBox(width: 10.0),
          profile_txt
        ]),
      ));

  static Text sections = new Text("Sections",
      style: new TextStyle(
          color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal));

  static final sections_parent = new GestureDetector(
      onTap: () {
        print("Sections clicked");
        Navigator.of(context_global).pushNamed('/DataTest');
      },
      child: new Container(
        child: new Row(children: <Widget>[
          new Image(
            image: new AssetImage('assets/ic_class_black_48dp.png'),
            height: 30.0,
            width: 30.0,
          ),
          new SizedBox(width: 10.0),
          sections
        ]),
      ));

  static Text exit = new Text("Exit",
      style: new TextStyle(
          color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal));

  static final exit_parent = new GestureDetector(
      onTap: () {
        print("Exit clicked");
        Navigator.of(context_global).pop();
      },
      child: new Container(
        child: new Row(children: <Widget>[
          new Image(
            image: new AssetImage('assets/ic_exit_to_app_black_48dp.png'),
            height: 30.0,
            width: 30.0,
          ),
          new SizedBox(width: 10.0),
          exit
        ]),
      ));

  static var pad = const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0);
  static Padding padding2 = new Padding(
    padding: pad,
    child: home_parent,
  );
  static Padding padding3 = new Padding(
    padding: pad,
    child: groups_parent,
  );
  static Padding padding4 = new Padding(
    padding: pad,
    child: profile_parent,
  );
  static Padding padding5 = new Padding(
    padding: pad,
    child: sections_parent,
  );
  static Padding padding6 = new Padding(
    padding: pad,
    child: exit_parent,
  );

  static var children = [
    profile,
    padding2,
    padding3,
    padding4,
    padding5,
    padding6
  ];
  static ListView listview = new ListView(children: children);
  Drawer drawer = new Drawer(
    child: listview,
  );

  @override
  Widget build(BuildContext context) {
    context_global = context;
    final title = 'MY - CPM';

    return new MaterialApp(
        title: title,
        home: new Scaffold(
          drawer: drawer,
          appBar: new AppBar(
            title: new Text(title),
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
                          backgroundImage:
                              new AssetImage('assets/carporate.jpg'),
                          radius: 40.0,
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, right: 10.0),
                        child: new CircleAvatar(
                          backgroundImage: new AssetImage('assets/news.png'),
                          radius: 40.0,
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, right: 10.0),
                        child: new GestureDetector(
                          onTap: (){Navigator.of(context).pushNamed('/HumanResources');},
                          child: new CircleAvatar(
                            backgroundImage: new AssetImage('assets/hr.png'),
                            radius: 40.0,
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, right: 10.0),
                        child: new CircleAvatar(
                          backgroundImage: new AssetImage('assets/finance.png'),
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
                new Text("Whats happening in CPM",
                    style: new TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal)),
                new Expanded(
                  child: new StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection('images').snapshots,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return new Text('Loading...');
                      return new ListView(
                        shrinkWrap: true,
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new MyCard(
                              title: new Text(document['file_name'],
                                  style: new TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal)),
                              image: new Image.network(document['path'],
                                  height: 200.0),
                              favourite: new Container(
                                  margin: new EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  child: new Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )));
                        }).toList(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

/* @override
  Widget build(BuildContext context) {
    context_global = context;
    final title = 'MY - CPM';

    return new MaterialApp(
        title: title,
        home: new Scaffold(
          drawer: drawer,
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new ListView(
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
                        backgroundImage: new AssetImage('assets/carporate.jpg'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage('assets/news.png'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage('assets/hr.png'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage('assets/finance.png'),
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
             new Expanded(child:new StreamBuilder<QuerySnapshot>(
               stream: Firestore.instance.collection('images').snapshots,
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                 if (!snapshot.hasData) return new Text('Loading...');
                 return new ListView(
                   children: snapshot.data.documents.map((DocumentSnapshot document) {
                     return new MyCard(
                       title:  new Text(document['file_name'],style: new TextStyle(
                           color: Colors.blue,
                           fontSize: 20.0,
                           fontStyle: FontStyle.italic)),
                       image: new Image.network(document['path'],
                           height: 200.0),
                     );
                   }).toList(),
                 );
               },
             ) )
            ],
          ),
        ));
  }*/

/*  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              pinned: true,
              title: new Text('Flutter Demo'),
            ),
          ];
        },
        body: new Column(
          children: <Widget>[
            new FlutterLogo(size: 100.0, colors: Colors.purple),
            new Container(
              height: 300.0,
              child: new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('images').snapshots,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('Loading...');
                  return new ListView(
                    children: snapshot.data.documents.map((DocumentSnapshot document) {
                      return new MyCard(
                        title:  new Text(document['file_name'],style: new TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic)),
                        image: new Image.network(document['path'],
                            height: 200.0),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }*/

/* @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Project Details"),
            backgroundColor: Colors.blue[800]),
        body:
        new CustomScrollView(
            slivers: <Widget>[
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
                        backgroundImage: new AssetImage('assets/carporate.jpg'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage('assets/news.png'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage('assets/hr.png'),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage('assets/finance.png'),
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
              */ /*new SliverPadding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,
                  top: 10.0,bottom: 0.0),
                sliver: new SliverList(delegate:
                new SliverChildListDelegate(getDataFromserver())),
              )*/ /*
            ]
        )
    );
  }*/

}
