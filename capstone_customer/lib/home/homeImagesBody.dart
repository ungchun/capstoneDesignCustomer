import 'package:capstone_customer/cafeinfo/cafeListViewModel.dart';
import 'package:capstone_customer/cafeinfo/cafeinfoWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeImagesBody extends StatefulWidget {
  @override
  _HomeImagesBodyState createState() => _HomeImagesBodyState();
}

final List<String> imgList = [
  "https://i.pinimg.com/736x/f3/ef/1b/f3ef1b910f37e5798c45b63cad7a1036.jpg",
  "https://mblogthumb-phinf.pstatic.net/MjAxNzA0MTNfMzUg/MDAxNDkyMDY5NTg2Mjk1.RHX9MwTGWTdYeSOAiWPzTlYiGaHM2SJ0X2MjdH9ui5sg.udvgC1kesuA69vtXC1-wd8mhcUy65AGpJ0LOEXJQOf4g.JPEG.realbeans/%EC%B9%B4%ED%8E%98%EC%9E%85%EA%B5%AC%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B416.jpg?type=w2",
  "https://i.pinimg.com/originals/47/b1/dc/47b1dcfcbc5ac15aaa311b3ab0674ac8.jpg",
  "https://i.pinimg.com/originals/dd/a1/a4/dda1a416b6acbb238c3bb9a0cb1f7998.jpg"
];

// final List<String> textList = ["공대카페", "도서관카페", "의양관카페", "신바어우관카페"];

class _HomeImagesBodyState extends State<HomeImagesBody> {
  Stream stream;

  @override
  void initState() {
    super.initState();

    stream = FirebaseFirestore.instance
        .collection('cafe')
        .orderBy('이름', descending: false) // true, false 내림차순 오름차순
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) return new Text(""); // 이거 안넣어주면 오류남
          return Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 30, 50, 50),
            child: Container(
              color: Color(0xFFDF0F4),
              height: 450,
              child: Swiper(
                loop: false,
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: SwiperPagination(
                    alignment: Alignment(0, 1.15),
                    builder: DotSwiperPaginationBuilder(
                        activeSize: 5,
                        size: 5,
                        activeColor: Colors.black,
                        color: Colors.blueGrey[200])),
                itemCount: imgList.length,
                onTap: (int index) => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CafeinfoWidget(snapshot.data.docs[index]))) // 이렇게 보내면 컬럼 전체를 보냄
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 400,
                              child: Image.network(imgList[index],
                                  fit: BoxFit.fill)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 420, 0, 0),
                            child: Center(
                                child: Text(
                              snapshot.data.docs[index].data()['이름'],
                              style: TextStyle(fontSize: 20),
                            )),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}
