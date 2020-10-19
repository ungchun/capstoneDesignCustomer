import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  int selectedRadioTile;
  int _counter = 1;

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        /*
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.grey,
        ),
        */
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Stack(
            //child: Column(
            //mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /* Container(
              // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              /*child: Container(
                height: 150,
                color: Colors.grey,
              ),*/
              // height: MediaQuery.of(context).size.width,
              height: 100,
              padding: EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      // blurRadius: 6.0,
                    ),
                  ]),
            ),*/

              //Padding(
              //   padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
              //child:
              Container(
                  height: MediaQuery.of(context).size.height - 82.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),
              Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width),
              ),

              // 음식 사진 넣을 것
              /*
              Positioned(top: 30.0,
              left: (MediaQuery.of(context).size.width/2) - 100.0,
              child: Hero(tag: widget.heroTag,
              child: Container(
                decoration: BoxDecoration(image: AssetImage(widget.heroTag),
                fit: BoxFit.cover
                ),),
                heigth: 200.0,
                width: 200.0
                ),
                */

              Positioned(
                top: 100.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('Americano',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    //  Container(
                    //  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    //child: Text(
                    SizedBox(height: 20.0),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "기본",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black54),
                      ),
                    ),
                    //), //),
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

                    Divider(
                      height: 3,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Container(
                    //margin: EdgeInsets.fromLTRB(30, 5, 0, 0),
                    //child: Text(
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "추가 선택",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black54),
                      ),
                    ),
                    //),

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
                        }),
                    Divider(
                      height: 3,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //margin: EdgeInsets.fromLTRB(30, 5, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("수량",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Monserrat',
                                    fontSize: 15.0,
                                    color: Colors.black54)),
                          ),
                          Container(
                              height: 25.0, color: Colors.grey, width: 1.0),
                          Container(
                              width: 125.0,
                              height: 40.0,
                              margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Color(0xFF7A9BEE)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  InkWell(
                                      onTap: _decrementCounter,
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            color: Color(0xFF7A9BEE)),
                                        child: Center(
                                            child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20.0,
                                        )),
                                      )),
                                  Text('$_counter',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0)),
                                  InkWell(
                                      onTap: _incrementCounter,
                                      child: Container(
                                          height: 25.0,
                                          width: 25.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                              color: Colors.white),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: Color(0xFF7A9BEE),
                                            size: 20.0,
                                          ))))
                                ],
                              ))
                        ],
                      ),
                    ), //),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      child: InkWell(
                        // padding: EdgeInsets.only(bottom: 5.0),
                        child: Container(
                            // width: 600,
                            decoration: BoxDecoration(
                              //borderRadius: BorderRadius.only(
                              //  topLeft: Radius.circular(10.0),
                              //),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),

                              color: Colors.black,
                            ),
                            height: 50.0,
                            child: Center(
                              child: Text('3,000원',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat')),
                            )),
                        onTap: () {},
                      ),
                    )
                    /*
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: RaisedButton(
                          color: Colors.black,
                          child: Text("1개 담기"),
                          splashColor: Colors.red,
                          disabledColor: Colors.cyanAccent,
                          disabledTextColor: Colors.black,
                          onPressed: () {},
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    */
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
