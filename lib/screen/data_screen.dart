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
            Firestore.instance
                .collection('payslip')
                .document()
                .setData({'row_name': 'Take Home', 'row_value': '23576.00'});
            /*Firestore.instance
                .collection('images')
                .document()
                .setData({'file_name': 'image_fashion.jpg', 'path': 'https://firebasestorage.googleapis.com/v0/b/silicon-airlock-129611.appspot.com/o/image_fashion.jpg?alt=media&token=00da5a0d-55e8-4e54-9040-6ee0d0f51f49'});*/
          },child: new Icon(Icons.add),),
        );
      },
    );
  }
}
