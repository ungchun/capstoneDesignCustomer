import 'package:capstone_customer/data/moor_database.dart';
import 'package:capstone_customer/order/orderWidget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class OrderCart extends StatefulWidget {
  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  // int count = 1;

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
      body: StreamBuilder<List<Order>>(
          stream: getMoordb.watchOrders(),
          builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
            if (snapshot.data == null) return new Text(""); // 이거 안넣어주면 오류남
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        // onTap: () => {
                        //   debugPrint("order size + ${snapshot.data.length}")
                        // },
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Container(
                                  child: Text("${snapshot.data[index].name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      // getMoordb.deleteAllOrder();
                                      debugPrint("${snapshot.data[index]}");
                                      //Order order = snapshot.data[index];
                                      getMoordb
                                          .deleteOrder(snapshot.data[index]);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("기본 : ${snapshot.data[index].price} 원"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${snapshot.data[index].price * snapshot.data[index].count} 원",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            snapshot.data[index].count == 1
                                                ? snapshot.data[index].count = 1
                                                : snapshot.data[index].count--;
                                            getMoordb.updateOrder(
                                                snapshot.data[index]);
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                            "${snapshot.data[index].count}개"),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            snapshot.data[index].count =
                                                snapshot.data[index].count + 1;
                                            getMoordb.updateOrder(
                                                snapshot.data[index]);
                                            // "${snapshot.data[index].count}++";
                                            // count++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // 이거 버튼 맨 밑으로 보내야하는데 + 스크롤 했을 때 안내려가야함
                          // Column(
                          //   children: [
                          //     RaisedButton(
                          //       child: Text("주문하기"),
                          //       onPressed: () {},
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ));
                  },
                ),
              ],
            );
          }),

      //여기 moor db -> firebase 로 주문할때 넘겨야함
      bottomNavigationBar: Container(
        child: RaisedButton(
          onPressed: () {
            FirebaseFirestore.instance.collection('order').doc('2').set({
              "menu": ["아메리카노", "카페라떼"],
              "count": [1, 1],
              "price": [4300, 4500],
              "상태": "",
              "카페이름": "공대카페",
              "cafeID": "1",
              "주문시간": "09:00"
            });
          },
          child: Text("주문하기"),
        ),
      ),
    );
  }
}
