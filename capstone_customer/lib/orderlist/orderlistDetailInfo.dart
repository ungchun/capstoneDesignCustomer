import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderlistDetailInfo extends StatefulWidget {
  final QueryDocumentSnapshot doc;
  OrderlistDetailInfo(this.doc);

  @override
  _OrderlistDetailInfoState createState() => _OrderlistDetailInfoState();
}

class _OrderlistDetailInfoState extends State<OrderlistDetailInfo> {
  int menuSize;
  int price = 0;
  String tempPrice = "";

  @override
  void initState() {
    super.initState();

    menuSize = widget.doc.data()['menu'].length;

    for(int i = 0; i<menuSize; i++){
      tempPrice = widget.doc.data()['price'][i];
      price += int.parse(tempPrice);
    }
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
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 30),
                child: Text(
                  "${widget.doc.data()['카페이름']}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: Text(
                  "주문내역",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
                child: Row(
                  children: [
                    for (int i = 0; i < menuSize; i++)
                      Text(
                        "${widget.doc.data()['menu'][i]}  ",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 10, 10),
                child: Text(
                  "가격",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
                child: Text(
                  "$price 원",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }
}
