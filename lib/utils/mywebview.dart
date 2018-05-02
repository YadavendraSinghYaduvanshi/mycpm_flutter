import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const kAndroidUserAgent =
    "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36";

String url = "http://mycpm.parinaam.in/pdf/oc1.pdf";

String selectedUrl = "http://drive.google.com/viewerng/viewer?embedded=true&url=";


class MyWebView extends StatelessWidget {

  //String url;

  MyWebView({Key key, url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter WebView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (_) => new MyHomePage(title: "Flutter WebView Demo",url: url,),
        "/widget": (_) => new WebviewScaffold(
          url: selectedUrl,
          appBar: new AppBar(
            title: new Text("Widget webview"),
          ),
          withZoom: true,
          withLocalStorage: true,
        )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.url}) : super(key: key);

  final String title;
  final String url;

  @override
  _MyHomePageState createState() => new _MyHomePageState(url: url);
}

class _MyHomePageState extends State<MyHomePage> {

  final String url;

  _MyHomePageState({Key key, this.url});

  // Instance of WebView plugin
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  // On destroy stream
  StreamSubscription _onDestroy;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  //TextEditingController _urlCtrl = new TextEditingController(text: selectedUrl);

  TextEditingController _codeCtrl =
  new TextEditingController(text: "window.navigator.userAgent");

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final _history = [];

  @override
  initState() {
    super.initState();

    flutterWebviewPlugin.close();

   /* _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });
*/
    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text("Webview Destroyed")));
      }
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          _history.add("onUrlChanged: $url");
        });
      }
    });

    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
          if (mounted) {
            setState(() {
              _history.add("onStateChanged: ${state.type} ${state.url}");
            });
          }
        });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();

    flutterWebviewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: selectedUrl + url,
      appBar: new AppBar(
        title: new Text("Form"),
      ),
      withZoom: true,
      withLocalStorage: true,
    );/*new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/widget");
            },
            child: new Text("Open widget webview"),
          ),
        ],
      ),
    )*/;
  }
}