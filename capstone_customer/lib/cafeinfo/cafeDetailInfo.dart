import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class CafeDetailInfo extends StatefulWidget {
  @override
  _CafeDetailInfoState createState() => _CafeDetailInfoState();
}

class _CafeDetailInfoState extends State<CafeDetailInfo> {

  Completer<GoogleMapController> _controller = Completer();
  CameraPosition gwanghwamun = CameraPosition(
    target: LatLng(35.859340, 128.487026), // 공대 1호관
    zoom: 17.0,
  );
  Set<Marker> _marker = Set();

  @override
  void initState() {
    super.initState();
    _marker.add(Marker(
      markerId: MarkerId('markerPosition'),
      position: LatLng(35.859340, 128.487026), // 공대 1호관
    ));
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
            
            // map
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
                child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: gwanghwamun,
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
