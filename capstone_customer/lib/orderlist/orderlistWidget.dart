import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'orderlistItem.dart';

class OrderlistWidget extends StatefulWidget {
  @override
  OrderlistWidgetState createState() => OrderlistWidgetState();
}

class OrderlistWidgetState extends State<OrderlistWidget> {
  Stream stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stream = FirebaseFirestore.instance
        .collection('order')
        .orderBy('주문시간', descending: false)
        .snapshots(); // true, false 내림차순 오름차순
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "주문내역",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: stream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) return Text(""); // 이거 안넣어주면 오류남
              return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (BuildContext context, int index) {
                  // 나중에 db count 값 넘기고, index 0 인 부분만 divider 하나 더 추가하기
                  return OrderListItem(snapshot.data.docs[index]);
                },
              );
            }));
  }
}
