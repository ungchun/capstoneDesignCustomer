import 'package:capstone_customer/data/moor_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  final QueryDocumentSnapshot doc;
  OrderWidget(this.doc);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  Stream stream;
  // test
  // Order order =
  //     Order(cafeID: 2, count: "count 2", name: "아메리카노", price: "1000");

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
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) return new Text(""); // 이거 안넣어주면 오류남
            return Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
                Container(
                  child: Text(widget.doc.data()['이름']),
                ),
                
              ],
            );
          }),
    );
  }
}
