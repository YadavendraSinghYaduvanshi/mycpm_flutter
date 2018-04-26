import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycpm_flutter/utils/Card.dart';

class ImagePage extends StatefulWidget {
  @override
  ImagePageState createState() => new ImagePageState();
}

const String kTestString = "Hello world!";

class ImagePageState extends State<ImagePage> {
  String _fileContents;

  Future<Null> _uploadFile() async {
    final Directory systemTempDir = Directory.systemTemp;
    final File file = await new File('${systemTempDir.path}/foo.txt').create();
    file.writeAsString(kTestString);
    assert(await file.readAsString() == kTestString);
    final String rand = "${new Random().nextInt(10000)}";
    final StorageReference ref =
    FirebaseStorage.instance.ref().child("foo$rand.txt");
    final StorageUploadTask uploadTask =
    ref.put(file, const StorageMetadata(contentLanguage: "en"));

    final Uri downloadUrl = (await uploadTask.future).downloadUrl;
    final http.Response downloadData = await http.get(downloadUrl);
    setState(() {
      _fileContents = downloadData.body;
    });

  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('images').snapshots,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new Scaffold(
          appBar: AppBar(
            title: new Text("Image"),
          ),
          body: new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new MyCard(
                title:  new Text(document['file_name'],style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic)),
                image: new Image.network(document['path'],
                    height: 200.0),
                favourite: new Icon(Icons.favorite, color: Colors.grey,),
              );
            }).toList(),
          ),
          floatingActionButton:new FloatingActionButton(
            onPressed: _uploadFile,
            tooltip: 'Upload',
            child: const Icon(Icons.file_upload),
          ),
        );
      },
    );
  }
}