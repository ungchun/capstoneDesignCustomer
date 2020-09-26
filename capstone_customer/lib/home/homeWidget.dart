import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'homeImagesBody.dart';
import 'homeText.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "매장찾기",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              HomeText(),
              HomeImagesBody(),
            ],
          ),
        ),
      ),
    );
  }
}
