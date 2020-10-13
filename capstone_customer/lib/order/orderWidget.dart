import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  Stream stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = FirebaseFirestore.instance
        .collection('order')
        .orderBy('주문시간', descending: false) // true, false 내림차순 오름차순
        .snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: RaisedButton(
                onPressed: () {
                  // debugPrint(snapshot.data.docs[2].data()['orderName']);
                  FirebaseFirestore.instance
                      .collection('order')
                      .doc('2')
                      .set({"orderName": "아메리카노", "온도": "Hot", "menu":["아메리카노","카페라떼"],"count":[1,2],"price":["4,300","3,500"]});
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
          );
        }
      ),
    );
  }
}
