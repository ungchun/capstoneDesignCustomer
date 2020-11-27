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
  "https://mblogthumb-phinf.pstatic.net/MjAxODA3MDlfMTgy/MDAxNTMxMTIwNjE0OTE5.U8_TNjEILKhBl6rdOc-uFNG6MDPX_KgoCMvXn7IMVYog.GmRP4cQiSa5xjcgvxICcepgjJZtlrkDzAy6aip6AcaMg.JPEG.mortareg/%EB%8B%A4%EB%82%AD_%EC%B9%B4%ED%8E%98_best5_%EC%98%88%EC%81%9C_%EC%B9%B4%ED%8E%98_%286%29.JPG?type=w800",
  "https://cdn.pixabay.com/photo/2019/09/24/09/58/marrakech-4500910__340.jpg",
  "https://cdn.pixabay.com/photo/2019/12/02/07/07/autumn-4667080__340.jpg",
  "https://cdn.pixabay.com/photo/2020/10/04/18/13/mountains-5627143__340.jpg"
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
