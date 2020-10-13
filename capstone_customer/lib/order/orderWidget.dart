import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: RaisedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('order')
                  .doc('2')
                  .set({"orderName": "아메리카노", "온도": "Hot"});
            },
            child: Text("orderAdd"),
          )),
          Center(
              child: RaisedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('order')
                  .doc('2')
                  .delete();
            },
            child: Text("orderDelete"),
          )),
        ],
      ),
    );
  }
}
