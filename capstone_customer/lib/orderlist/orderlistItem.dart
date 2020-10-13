import 'package:capstone_customer/cafeinfo/cafeinfoWidget.dart';
import 'package:capstone_customer/orderlist/orderlistDetailInfo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderListItem extends StatefulWidget {

  final QueryDocumentSnapshot doc;
  OrderListItem(this.doc);

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  // firestore 데이터 읽어오기 test
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void test() {
    String title = "";
    firestore.collection("test").doc("1").get().then((DocumentSnapshot ds) {
      title = ds.data()['name'];
      print("asd " + title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Text(
            "${widget.doc.data()['주문시간']}",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 0, 0),
          child: Text(
            "${widget.doc.data()['카페이름']}",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 0, 0),
          child: Text(
            "13,000원",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: RaisedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CafeinfoWidget())
                  //         );
                  // print("가게보기 click");
                },
                child: Text("가게보기"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderlistDetailInfo(widget.doc)));
                  // test();
                },
                child: Text("주문상세"),
              ),
            ),
          ],
        ),
        Divider(
          height: 30,
          thickness: 10,
        )
      ],
    );
  }
}
