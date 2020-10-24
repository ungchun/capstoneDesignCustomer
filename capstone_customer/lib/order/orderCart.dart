import 'package:capstone_customer/data/moor_database.dart';
import 'package:capstone_customer/order/orderWidget.dart';
import 'package:flutter/material.dart';

class OrderCart extends StatefulWidget {
  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  int count = 1;
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
                                  "${snapshot.data[index].price} 원",
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
                                            count == 1 ? count = 1 : count--;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text("$count개"),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
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
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: RaisedButton(
                //     child: Text("moor db insert test"),
                //     onPressed: () {
                //       getMoordb.insertOrder(order);
                //     },
                //   ),
                // ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: RaisedButton(
                //     child: Text("moor db delete test"),
                //     onPressed: () {
                //       getMoordb.deleteAllOrder();
                //     },
                //   ),
                // ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: RaisedButton(
                //     child: Text("moor db watch test"),
                //     onPressed: () {
                //       print(stream);
                //     },
                //   ),
                // )
              ],
            );
          }),
    );
  }
}
