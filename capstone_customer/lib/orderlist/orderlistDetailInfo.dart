import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class OrderlistDetailInfo extends StatefulWidget {
  var map = <String, dynamic>{};
  OrderlistDetailInfo(this.map);

  _OrderlistDetailInfoState createState() => _OrderlistDetailInfoState();
}

class _OrderlistDetailInfoState extends State<OrderlistDetailInfo> {
  var tempPrice = 0;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < widget.map['price'].length; i++) {
      tempPrice += widget.map['price'][i] * widget.map['count'][i];
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "상세내역",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 310, 0),
              child: Text(
                '${widget.map['카페이름']}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(350, 30, 0, 0),
              child: Text(
                '${widget.map['주문시간']}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 50, 0, 0),
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.map['menu'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return _menuview(widget.map['menu'][index]);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.map['count'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return _countview(widget.map['count'][index]);
                        },
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 50),
                //     child: Container(
                //       height: 250,
                //       child: ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         itemCount: widget.map['price'].length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return _priceview(widget.map['price'][index]);
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 15, 0),
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.map['price'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return _sumpriceview(widget.map['price'][index] *
                              widget.map['count'][index]);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 0,
              thickness: 5,
              indent: 38,
              endIndent: 38,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                  child: Text(
                    '총 합',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 50, 0),
                  child: Text(
                    '$tempPrice 원',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuview(dynamic doc) {
    return Column(
      children: [
        Text(
          '$doc',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Divider(
        //   height: 10,
        //   color: Colors.black,
        //   indent: 0,
        // ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _priceview(dynamic doc) {
    return Column(
      children: [
        Text(
          '$doc 원',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        // Divider(
        //   height: 10,
        //   color: Colors.black,
        //   endIndent: 38,
        // ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _countview(dynamic doc) {
    return Column(
      children: [
        Text(
          '$doc 개',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        // Divider(
        //   height: 10,
        //   color: Colors.black,
        // ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _sumpriceview(dynamic doc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$doc 원',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        // Divider(
        //   height: 10,
        //   color: Colors.black,
        // ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}