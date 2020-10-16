import 'package:flutter/material.dart';

class OrderCart extends StatefulWidget {
  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Container(
                                child: Text("아이스 아메리카노",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                              child: Container(
                                child: Icon(Icons.close),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text("기본 : 4300 원"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "4300 원",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {},
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Text("1개"),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              child: Text("주문하기"),
              onPressed: () {
                
              },
            ),
          )
        ],
      ),
    );
  }
}
