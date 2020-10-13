import 'package:flutter/material.dart';
import 'QRCodeScanner.dart';

class QrWidget extends StatefulWidget {
  @override
  _QrWidgetState createState() => _QrWidgetState();
}



class _QrWidgetState extends State<QrWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Code',
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/5416212.png',
                width: 200,
              ),
              RaisedButton(
                child: Text('QR Code Scanner Here!'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                        return QRCodeScanner();
                      })
                  );
                },
              ),
            ],
          )),
    );
  }
}