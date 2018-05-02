import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class DocsViewPDF extends StatefulWidget {
  @override
  _DocsViewPDFState createState() => new _DocsViewPDFState();
}

class _DocsViewPDFState extends State<DocsViewPDF> {

  Future<Null> _launched;
  var url = "https://firebasestorage.googleapis.com/v0/b/silicon-airlock-129611.appspot.com/o/Parinam_Reporting-PO1_PepsiCo.pdf?alt=media&token=a57c9ccb-0433-4a48-8db5-b47d4f276838";

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: url,
      withJavascript: true,
      withLocalStorage: true,
    )/*new Container(
      child: new RaisedButton(child: new Text("open Pdf"),
          onPressed:(){
        setState(() {
         _launched = _launchInBrowser("https://firebasestorage.googleapis.com/v0/b/silicon-airlock-129611.appspot.com/o/Parinam_Reporting-PO1_PepsiCo.pdf?alt=media&token=a57c9ccb-0433-4a48-8db5-b47d4f276838");
        });
      }),
    )*/;
  }

  Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}

