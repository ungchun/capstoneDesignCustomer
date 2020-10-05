import 'package:flutter/material.dart';

class CafeMenu extends StatefulWidget {
  @override
  _CafeMenuState createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
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

    // stream = FirebaseFirestore.instance
    //     .collection('products')
    //     .orderBy("uploadtime", descending: true)
    //     .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        this.renderHeader(),
      ],
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
                      // stream = _headerindex == 0
                      //     ? FirebaseFirestore.instance
                      //         .collection('products')
                      //         .orderBy("uploadtime", descending: true)
                      //         .snapshots()
                      //     : FirebaseFirestore.instance
                      //         .collection('products')
                      //         .where("category",
                      //             isEqualTo: _categoryItems[_headerindex])
                      //         .orderBy("uploadtime", descending: true)
                      //         .snapshots();
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
}
