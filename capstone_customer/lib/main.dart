import 'package:capstone_customer/qr/qrWidget.dart';
import 'package:flutter/material.dart';
import 'home/homeWidget.dart';
import 'myinfo/myinfoWidget.dart';
import 'orderlist/orderlistWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottombarindex = 0;

  final List<Widget> _bottomWidgetList = [
    HomeWidget(),
    OrderlistWidget(),
    QrWidget(),
    MyinfoWidget(),
  ];

  Widget getBottomBar() {
    return BottomNavigationBar(
      currentIndex:
          _bottombarindex, // this will be set when a new tab is tapped
      onTap: (int index) {
        setState(() {
          this._bottombarindex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false, // title 안보이게 설정
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              color: _bottombarindex == 0 ? Colors.pink : Colors.black),
          title: Text('홈'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list,
              color: _bottombarindex == 1 ? Colors.pink : Colors.black),
          title: Text('주문내역'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps,
              color: _bottombarindex == 2 ? Colors.pink : Colors.black),
          title: Text('QR'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,
              color: _bottombarindex == 3 ? Colors.pink : Colors.black),
          title: Text('내정보'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomWidgetList[_bottombarindex],
      bottomNavigationBar: getBottomBar(),
      // ),
    );
  }
}
