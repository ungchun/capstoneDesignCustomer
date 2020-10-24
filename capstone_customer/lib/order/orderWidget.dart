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
  Order order;
  int cafeID;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Container(
                    child: Text(widget.doc.data()['이름']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Container(
                    child: Text(widget.doc.data()['영어이름']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    "${widget.doc.data()['가격']} 원",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,30,0,0),
                  child: Center(
                    child: RaisedButton(
                      child: Text("장바구니에 담기"),
                      onPressed: (){
                        cafeID = int.parse(widget.doc.data()['cafeID']);
                        order = Order(cafeID: cafeID, count: "1", name: "${widget.doc.data()['이름']}", price: "${widget.doc.data()['가격']}");
                        getMoordb.insertOrder(order);
                      },
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
