import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataTest extends StatefulWidget {
  @override
  DataState createState() => new DataState();
}

class DataState extends State<DataTest> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('books').snapshots,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new Scaffold(
          appBar: AppBar(
            title: new Text("Data"),
          ),
          body: new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document['title']),
                subtitle: new Text(document['author']),
              );
            }).toList(),
          ),
          floatingActionButton: new FloatingActionButton(onPressed: (){
            /*Firestore.instance
                .collection('payslip')
                .document()
                .setData({'row_name': 'Take Home', 'row_value': '23576.00'});*/
            Firestore.instance
                .collection('news')
                .document()
                .setData({'file_name': 'Auto Expo is going to start at Expo Mart from 21 may to 26 May.', 'path': 'https://firebasestorage.googleapis.com/v0/b/silicon-airlock-129611.appspot.com/o/nexpo02.jpg?alt=media&token=063a4b75-b016-450d-b469-1267bb14356a'});
          },child: new Icon(Icons.add),),
        );
      },
    );
  }
}
