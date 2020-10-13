import 'package:flutter/material.dart';

class cafeListViewModel{
  final String name;
  final String latitude; // 위도
  final String longitude; // 경도
  final String personalDay; // 휴무일
  final String businewssHours; // 영업시간
  final String callNumber;
  final String location;

  const cafeListViewModel({
    this.name,
    this.latitude,
    this.longitude,
    this.personalDay,
    this.businewssHours,
    this.callNumber,
    this.location,
  });
  

}
