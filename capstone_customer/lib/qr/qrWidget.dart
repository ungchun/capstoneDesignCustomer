import 'package:flutter/material.dart';

class QrWidget extends StatefulWidget {
  @override
  _QrWidgetState createState() => _QrWidgetState();
}

class _QrWidgetState extends State<QrWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("qr"),
      ),
    );
  }
}