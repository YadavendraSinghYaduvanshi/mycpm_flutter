import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycpm_flutter/utils/payslip_item.dart';

class PaySlip extends StatefulWidget {
  @override
  _PaySlipState createState() => new _PaySlipState();
}

class _PaySlipState extends State<PaySlip> {
  var title = "Payslip";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
          child: Column(
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
              child: new StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('payslip').snapshots,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('Loading...');
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return new PayslipItem(
                    name: new Text(document['row_name'],
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontStyle: FontStyle.normal)),
                    value: new Text(document['row_value'],
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontStyle: FontStyle.normal)),
                  );
                }).toList(),
              );
            },
          ))
        ],
      )),
    );
  }
}
