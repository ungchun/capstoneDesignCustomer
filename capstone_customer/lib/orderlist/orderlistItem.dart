import 'package:flutter/material.dart';

class OrderListItem extends StatefulWidget {
  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,10,0,0),
          child: Text("1분전",style: TextStyle(color: Colors.grey,fontSize: 10),),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,2,0,0),
          child: Text("공대카페",style: TextStyle(color: Colors.black,fontSize: 30, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,2,0,0),
          child: Text("13,000원",style: TextStyle(color: Colors.black),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,10,0),
              child: RaisedButton(
                onPressed: () {
                  print("가게보기 click");
                },
                child: Text("가게보기"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,10,0),
              child: RaisedButton(
                onPressed: () {
                  print("주문상세 click");
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
