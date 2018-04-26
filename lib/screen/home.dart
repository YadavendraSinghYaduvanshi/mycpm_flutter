import 'package:flutter/material.dart';
import './image.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Home';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 5.0),
                height: 200.0,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, right: 5.0),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            'http://thecatapi.com/api/images/get?format=src'
                                '&size=small&type=jpg#${title.hashCode}'
                        ),
                        radius: 40.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            'http://thecatapi.com/api/images/get?format=src'
                                '&size=small&type=jpg#${title.hashCode}'
                        ),
                        radius: 50.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            'http://thecatapi.com/api/images/get?format=src'
                                '&size=small&type=jpg#${title.hashCode}'
                        ),
                        radius: 50.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            'http://thecatapi.com/api/images/get?format=src'
                                '&size=small&type=jpg#${title.hashCode}'
                        ),
                        radius: 50.0,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            'http://thecatapi.com/api/images/get?format=src'
                                '&size=small&type=jpg#${title.hashCode}'
                        ),
                        radius: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 20.0),
                height: 50.0,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    new MyImageWidget(),
                    new Container(
                      width: 160.0,
                      color: Colors.blue,
                    ),
                    new Container(
                      width: 160.0,
                      color: Colors.green,
                    ),
                    new Container(
                      width: 160.0,
                      color: Colors.yellow,
                    ),
                    new Container(
                      width: 160.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(
                    top: 4.0, bottom: 4.0, right: 10.0),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      'http://thecatapi.com/api/images/get?format=src'
                          '&size=small&type=jpg#${title.hashCode}'
                  ),
                  radius: 50.0,
                ),
              ),
              new RaisedButton(child: new Text("Next"),onPressed: (){Navigator.of(context).pushNamed('/Second');})
            ],
          ),
        ),
      ),
    );
  }

}