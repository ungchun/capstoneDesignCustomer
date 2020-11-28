import 'package:capstone_customer/data/moor_database.dart';
import 'package:capstone_customer/order/orderWidget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';
// import 'package:moor_flutter/moor_flutter.dart';

import '../main.dart';

// ignore: must_be_immutable
class OrderCart extends StatefulWidget {
  final QuerySnapshot data;
  OrderCart(this.data);

  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  AsyncSnapshot<List<Order>> _array;
  int a = 0;

  @override
  void initState() {
    super.initState();
    a = int.parse(widget.data.docs.length.toString());
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
            _array = snapshot;
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
                                      _array = snapshot;
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
                                            _array = snapshot;
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
                                            _array = snapshot;
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
        height: 50,
        child: RaisedButton(
          color: Colors.white70,
          onPressed: () {
            List _testA = [];
            List _testB = [];
            List _testC = [];
            int price = 0;

            setState(() {
              a++;
            });

            for (int i = 0; i < _array.data.length; i++) {
              String a = _array.data[i].name.toString();
              int b = _array.data[i].count;
              int c = _array.data[i].price;
              _testA.add(a);
              _testB.add(b);
              _testC.add(c);
              price += _array.data[i].price * _array.data[i].count;
            }
            FirebaseFirestore.instance
                .collection('order')
                .doc(a.toString())
                .set({
              "menu": _testA,
              "count": _testB,
              "price": _testC,
              "상태": "대기",
              "카페이름": "공대카페",
              "cafeID": "1",
              "주문시간": "09:00"
            });
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Payment(price: price)));
          },
          child: Text("주문하기"),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Payment extends StatelessWidget {
  dynamic price;

  Payment({@required this.price}) : assert(price != null);

  @override
  Widget build(context) {
    return IamportPayment(
      appBar: new AppBar(
        title: new Text(price.toString()),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://cdn.pixabay.com/photo/2020/04/01/22/14/lover-4992877__480.png'),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp77229376',
      /* [필수입력] 결제 데이터 */
      data: PaymentData.fromJson({
        'pg': 'kakaopay', // PG사
        'payMethod': 'card', // 결제수단
        'name': '아임포트 결제데이터 분석', // 주문명
        // 'merchantUid': 'mid_0',
        'merchantUid': 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        'amount': price, // 결제금액
        // 'amount': int.parse(data['price'].toString()), // 결제금액
        'buyerName': '김성훈', // 구매자 이름
        'buyerTel': '01012345678', // 구매자 연락처
        'buyerEmail': 'example@naver.com', // 구매자 이메일
        'buyerAddr': '대구광역시 중구 남산4동 2655-18', // 구매자 주소
        'buyerPostcode': '12345', // 구매자 우편번호
        'appScheme': 'example', // 앱 URL scheme
        'display': {
          'cardQuota': [2, 3] //결제창 UI 내 할부개월수 제한
        }
      }),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
//        print(result);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyApp()),
            (Route<dynamic> route) => false);
      },
    );
  }
}
