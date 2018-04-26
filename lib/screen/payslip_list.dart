import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycpm_flutter/utils/form_card.dart';

class PaySlipList extends StatefulWidget {
  @override
  _PaySlipListState createState() => new _PaySlipListState();
}

class _PaySlipListState extends State<PaySlipList> {
  var title = "Payslip - Select Month";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            new Expanded(
                child: new GestureDetector(
                  onTap: (){Navigator.of(context).pushNamed('/PaySlip');},
                  child: new StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection('payslip_list').snapshots,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return new Text('Loading...');
                      return new ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new Form_Card(
                            name: new Text(document['month_year']),
                            time: new Text(""),
                            image: new CircleAvatar(
                              backgroundImage:
                              new AssetImage('assets/forms_icon.png'),
                              radius: 30.0,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),)
          ],
        ),
      ),
    );
  }
}
