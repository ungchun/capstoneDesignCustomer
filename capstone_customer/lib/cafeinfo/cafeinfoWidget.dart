import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cafeDetailInfo.dart';
import 'cafeMenu.dart';

class CafeinfoWidget extends StatefulWidget {
  
  final QueryDocumentSnapshot doc;
  CafeinfoWidget(this.doc);


  @override
  _CafeinfoWidgetState createState() => _CafeinfoWidgetState();
}

class _CafeinfoWidgetState extends State<CafeinfoWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "메뉴",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "카페정보",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text(
            "${widget.doc.data()['이름']}",
            style: TextStyle(color: Colors.black),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            CafeMenu(widget.doc),
            CafeDetailInfo(widget.doc),
          ],
        ),
      ),
    ));
  }


}
