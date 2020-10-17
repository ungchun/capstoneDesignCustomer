import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                height: 150,
                color: Colors.grey,
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "기본",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                height: 100,
                // color: Colors.white,
              ),
            ),
            Divider(
              height: 3,
              thickness: 1,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "추가 선택",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 50),
                child: CheckboxListTile(
                    title: Text(
                      "샷 추가",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    secondary: Text("+500원"),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _checked,
                    onChanged: (bool value) {
                      setState(() {
                        _checked = value;
                      });
                    })),
            Divider(
              height: 3,
              thickness: 1,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "수량",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(200, 5, 0, 0),
                      child: Text(
                        "1개",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text("1개 담기"),
                  splashColor: Colors.red,
                  disabledColor: Colors.cyanAccent,
                  disabledTextColor: Colors.black,
                  onPressed: () {},
                  textColor: Colors.white,
                )),
          ],

          /*
        children: <Widget>[
            Checkbox(
              value: chechBoxValue,
              onChanged: (bool value) {
                print(value);

                setState(() {
                  chechBoxValue = value;
                });
              },
            ),
            Text("샷 추가")
        ],*/
        ),
      ),
    );
  }
}
