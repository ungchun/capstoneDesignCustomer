import 'package:flutter/material.dart';

class CafeDetailInfo extends StatefulWidget {
  @override
  _CafeDetailInfoState createState() => _CafeDetailInfoState();
}

class _CafeDetailInfoState extends State<CafeDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
            child: Text(
              "영업시간",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
            child: Text(
              "09:00 ~ 21:00",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 10, 10),
            child: Text(
              "휴무일",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
            child: Text(
              "없음",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 10, 10),
            child: Text(
              "전화번호",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
            child: Text(
              "000-0000-0000",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 10, 10),
            child: Text(
              "위치",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
            child: Text(
              "공과대학 1호관 1층",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
