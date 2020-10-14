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
  int menuSize;
  int price = 0;
  String tempPrice = "";
  Stream stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuSize = widget.doc.data()['menu'].length;

    for (int i = 0; i < menuSize; i++) {
      tempPrice = widget.doc.data()['price'][i];
      price += int.parse(tempPrice);
    }
    stream = FirebaseFirestore.instance
        .collection('cafe')
        .where('ID', isEqualTo: widget.doc.data()['cafeID'])
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         if (snapshot.data == null) return new Text(""); // 이거 안넣어주면 오류남
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider(
            //   height: 30,
            //   thickness: 10,
            // ),
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
                "$price 원",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CafeinfoWidget(snapshot.data.docs[0]))
                              // 위에 stream where 절에서 cafe를 걸렀기 때문에 배열안에는 1개밖에없다 doc[0] where 절에서 나온 cafe 정보
                              );
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
                              builder: (context) =>
                                  OrderlistDetailInfo(widget.doc)));
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
            ),
          ],
        );
      }
    );
  }
}
