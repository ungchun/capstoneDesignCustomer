import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

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
            //Padding(
            //   padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            //child:
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 0, 0),
              child: Text(
                "기본",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ), //),
            //Padding(
            //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            RadioListTile(
              value: 1,
              groupValue: selectedRadioTile,
              title: Text(
                "Iced",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              //subtitle: Text("+0원"),
              onChanged: (val) {
                setSelectedRadioTile(val);
              },
              activeColor: Colors.black54,
              secondary: Text("+0원"),
              selected: true,
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedRadioTile,
              title: Text(
                "Hot",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              //subtitle: Text("+0원"),
              onChanged: (val) {
                setSelectedRadioTile(val);
              },
              activeColor: Colors.black54,
              secondary: Text("+0원"),
              selected: false,
            ),

            //  ),
            /*
              child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                  ]),
            ),
            */

            /*
                child: CheckboxListTile(
                    title: Text(
                      "아메리카노",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    secondary: Text("3,000원"),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _checked,
                    onChanged: (bool value) {
                      setState(() {
                        _checked = value;
                      });
                    })
                    ),*/

            /*
              child: InkWell(
                onTap: () {
                  setState(() {
                    _checked = !_checked;
                  });
                },
                child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _checked
                        ? Icon(
                            Icons.check,
                            size: 10.0,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.check_box_outline_blank,
                            size: 10.0,
                            color: Colors.blue,
                          ),
                  ),
                ),
                */

            /*
              child: Container(
                height: 100,
                // color: Colors.white,
              ),*/

            Divider(
              height: 3,
              thickness: 1,
            ),
            //Padding(
            //  padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 0, 0),
              child: Text(
                "추가 선택",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ), //),
            //Padding(
            //  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            CheckboxListTile(
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
                }), //),
            Divider(
              height: 3,
              thickness: 1,
            ),
            //Padding(
            //  padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 0, 40),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "수량",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
              ),
            ), //),
            //Padding(
            //  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            RaisedButton(
              color: Colors.blue,
              child: Text("1개 담기"),
              splashColor: Colors.red,
              disabledColor: Colors.cyanAccent,
              disabledTextColor: Colors.black,
              onPressed: () {},
              textColor: Colors.white,
            ), //),
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
