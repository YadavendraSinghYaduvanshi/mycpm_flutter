import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycpm_flutter/utils/form_card.dart';
import 'package:mycpm_flutter/utils/mywebview.dart';


class Forms extends StatefulWidget {
  @override
  _FormsState createState() => new _FormsState();
}

class _FormsState extends State<Forms> {
  static var pad = const EdgeInsets.only(left: 8.0, top: 20.0, bottom: 10.0);
  static Padding padding1 = new Padding(
    padding: pad,
    child: new Text("Forms",
        textAlign: TextAlign.left,
        style: new TextStyle(
            color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal)),
  );

  static Padding padding2 = new Padding(
    padding: pad,
    child: new Text("References",
        textAlign: TextAlign.left,
        style: new TextStyle(
            color: Colors.blue, fontSize: 20.0, fontStyle: FontStyle.normal)),
  );

/*  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Forms"),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            padding1,
          new Expanded(
              child: new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('forms').snapshots,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('Loading...');
                  return new ListView(
                    children: snapshot.data.documents.map((DocumentSnapshot document) {
                      return new Form_Card(
                        name: new Text(document['form_name']),
                        time: new Text(document['update_time']),
                        image: new CircleAvatar(
                          backgroundImage: new AssetImage(
                              'assets/forms_icon.png'),
                          radius: 30.0,
                        ),
                      );
                    }).toList(),
                  );
                },
              )
          ),
            padding2,
            new Expanded(
                child: new StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('references').snapshots,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return new Text('Loading...');
                    return new ListView(
                      children: snapshot.data.documents.map((DocumentSnapshot document) {
                        return new Form_Card(
                          name: new Text(document['form_name']),
                          time: new Text(document['update_time']),
                          image: new CircleAvatar(
                            backgroundImage: new AssetImage(
                                'assets/reference_icon.png'),
                            radius: 30.0,
                          ),
                        );
                      }).toList(),
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              pinned: true,
              title: new Text('Forms'),
            ),
          ];
        },
        body: new Container(
          child: Column(
            children: <Widget>[
              padding1,
              new Expanded(
                  child: new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('forms').snapshots,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('Loading...');
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return
                        new GestureDetector(
                          onTap: (){Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new MyWebView(url: document['url']),
                            ));},
                          child: new Form_Card(
                            name: new Text(document['form_name']),
                            time: new Text(document['update_time']),
                            image: new CircleAvatar(
                              backgroundImage:
                              new AssetImage('assets/forms_icon.png'),
                              radius: 30.0,
                            ),
                          ),
                        );
                    }).toList(),
                  );
                },
              )),
              padding2,
              new Expanded(
                  child: new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('references').snapshots,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('Loading...');
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return
                        new GestureDetector(
                          onTap: (){Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new MyWebView(url: document['url']),
                              ));},
                          child: new Form_Card(
                            name: new Text(document['form_name']),
                            time: new Text(document['update_time']),
                            image: new CircleAvatar(
                              backgroundImage:
                              new AssetImage('assets/reference_icon.png'),
                              radius: 30.0,
                            ),
                          ),
                        );
                    }).toList(),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
