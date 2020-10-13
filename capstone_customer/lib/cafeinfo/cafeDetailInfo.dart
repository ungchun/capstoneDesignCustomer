import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class CafeDetailInfo extends StatefulWidget {
  final QueryDocumentSnapshot doc;
  CafeDetailInfo(this.doc);

  @override
  _CafeDetailInfoState createState() => _CafeDetailInfoState();
}

class _CafeDetailInfoState extends State<CafeDetailInfo> {
  Stream stream;
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _mapPosition;
  Set<Marker> _marker = Set();

  @override
  void initState() {
    super.initState();
    // debugPrint(widget.doc.data()["영업시간"].toString());

    double latitude; // 위도
    double longitude; // 경도

    latitude = double.parse(widget.doc.data()['위도']);
    longitude = double.parse(widget.doc.data()['경도']);

    _marker.add(Marker(
      markerId: MarkerId('markerPosition'),
      position: LatLng(latitude, longitude),
    ));
    _mapPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 17.0,
    );

    // stream = FirebaseFirestore.instance
    //     .collection('cafe')
    //     .doc('${widget.id}')
    //     .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                "${widget.doc.data()["영업시간"]}",
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
                "${widget.doc.data()["휴무일"]}",
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
                "${widget.doc.data()["전화번호"]}",
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
                "${widget.doc.data()["위치"]}",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),

            // map
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
                child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _mapPosition,
                    markers: _marker,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
