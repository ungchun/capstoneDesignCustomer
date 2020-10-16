import 'package:capstone_customer/data/moor_database.dart';
import 'package:capstone_customer/order/orderWidget.dart';
import 'package:flutter/material.dart';

class OrderCart extends StatefulWidget {
  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  Order order = Order(cafeID: "1", count: "count 2", name: "아메리카노", price: "1000원");
  Stream stream = getMoordb.watchOrders();

  @override
  void initState() {
    super.initState();
  }

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

          // insert 잘 들어가는거 같은데 watch 하려면 streambuilder 써야하니까 값 넘겨받아서 test 한번 해보기
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              child: Text("moor db insert test"),
              onPressed: () {
                getMoordb.insertOrder(order);
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              child: Text("moor db delete test"),
              onPressed: () {
                getMoordb.deleteAllOrder();
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              child: Text("moor db watch test"),
              onPressed: () {
                print(stream);
              },
            ),
          )
        ],
      ),
    );
  }
}
