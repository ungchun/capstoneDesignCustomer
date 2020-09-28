import 'package:capstone_customer/cafeinfo/cafeinfoWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeImagesBody extends StatefulWidget {
  @override
  _HomeImagesBodyState createState() => _HomeImagesBodyState();
}

final List<String> imgList = [
  "https://cdn.pixabay.com/photo/2020/09/01/06/10/lake-5534341__340.jpg",
  "https://cdn.pixabay.com/photo/2019/09/24/09/58/marrakech-4500910__340.jpg",
  "https://cdn.pixabay.com/photo/2019/12/02/07/07/autumn-4667080__340.jpg"
];

final List<String> textList = [
  "공대카페",
  "도서관카페",
  "의양관카페",
];

class _HomeImagesBodyState extends State<HomeImagesBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 30, 50, 50),
      child: Container(
        color: Color(0xFFDF0F4),
        height: 450,
        child: Swiper(
          loop: false,
          // autoplay: true,
          viewportFraction: 0.8,
          scale: 0.9,
          // layout: SwiperLayout.TINDER,
          // itemWidth: 300,
          // itemHeight: 400,
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
                MaterialPageRoute(builder: (context) => CafeinfoWidget()))
          },
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 400,
                        child: Image.network(imgList[index], fit: BoxFit.fill)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 420, 0, 0),
                      child: Center(
                          child: Text(
                        textList[index],
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
  }
}
