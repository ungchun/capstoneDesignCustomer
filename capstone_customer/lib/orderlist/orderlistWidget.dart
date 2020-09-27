import 'package:flutter/material.dart';

import 'orderlistItem.dart';

class OrderlistWidget extends StatefulWidget {
  @override
  OrderlistWidgetState createState() => OrderlistWidgetState();
}

class OrderlistWidgetState extends State<OrderlistWidget> {
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
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            // 나중에 db count 값 넘기고, index 0 인 부분만 divider 하나 더 추가하기
            return OrderListItem();
          },
        ));
  }
}
