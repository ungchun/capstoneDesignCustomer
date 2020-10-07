import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,60,230,0),
      child: Container(
        height: 40,
        child: Text("테스트",style: TextStyle(fontSize: 28),),
      ),
    );
  }
}