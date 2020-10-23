import 'package:capstone_customer/order/orderWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CafeMenu extends StatefulWidget {
  final QueryDocumentSnapshot doc;
  CafeMenu(this.doc);

  @override
  _CafeMenuState createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
  Stream stream;
  int _headerindex;
  List<String> _categoryItems;

  @override
  void initState() {
    super.initState();
    _headerindex = 0;

    _categoryItems = [
      "전체",
      "커피",
      "티",
      "프라푸치노",
      "음료수",
      "브레드",
      "쿠키",
      "샌드위치",
      "기타",
    ];

    stream = FirebaseFirestore.instance
        .collection('menu')
        .where('cafeID', isEqualTo: widget.doc.data()['ID'])
        .orderBy('category', descending: false) // true, false 내림차순 오름차순
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          this.renderHeader(),
          this.renderBody(),
        ],
      ),
    );
  }

  Widget renderHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 5),
        SizedBox(
          height: 50.0,
          child: ListView.builder(
            padding: EdgeInsets.all(5.0),
            physics: ClampingScrollPhysics(),
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categoryItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: _headerindex == index ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _categoryItems[index],
                        textAlign: TextAlign.center,
                        // textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 15,
                          color: _headerindex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _headerindex = index;
                      stream = _headerindex == 0
                          ? FirebaseFirestore.instance
                              .collection('menu')
                              .where('cafeID',
                                  isEqualTo: widget.doc.data()['ID'])
                              .orderBy('category', descending: false)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('menu')
                              .where('cafeID',
                                  isEqualTo: widget.doc.data()['ID'])
                              .where('category',
                                  isEqualTo: _categoryItems[index])
                              .orderBy('이름', descending: false)
                              .snapshots();
                    });
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget renderBody() {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) return new Text(""); // 이거 안넣어주면 오류남
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.size,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderWidget(snapshot.data.docs[index])))
                },
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(snapshot.data.docs[index].data()['이름']),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child:
                                Text(snapshot.data.docs[index].data()['영어이름']),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(snapshot.data.docs[index].data()['가격']),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
