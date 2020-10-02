import 'package:flutter/material.dart';

class OrderlistDetailInfo extends StatefulWidget {
  @override
  _OrderlistDetailInfoState createState() => _OrderlistDetailInfoState();
}

class _OrderlistDetailInfoState extends State<OrderlistDetailInfo> {
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
                  "공대카페",
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
                child: Text(
                  "아메리카노, 카페라떼",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
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
                  "13,000원",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }
}
