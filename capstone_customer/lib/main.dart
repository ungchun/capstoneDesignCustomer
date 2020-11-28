import 'package:capstone_customer/qr/qrWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'cafeinfo/cafeListViewModel.dart';
import 'home/homeWidget.dart';
import 'myinfo/myinfoWidget.dart';
import 'orderlist/orderlistWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// void main(){
//   runApp(MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
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
  Stream stream;
  var _flutterLocalNotificationsPlugin;
  List<int> _arry = List<int>(2);
  int indx = 0;
  int count = 0;

  final List<Widget> _bottomWidgetList = [
    HomeWidget(),
    OrderlistWidget(),
    QrWidget(),
    MyinfoWidget(),
  ];

  @override
  void initState() {
    super.initState();
    stream = FirebaseFirestore.instance
        .collection('order')
        .orderBy('주문시간', descending: false)
        .snapshots();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();

    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String payload) async {
    debugPrint("$payload");
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Notification Payload'),
              content: Text('Payload: $payload'),
            ));
  }

  Widget getBottomBar() {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) return Text(""); // 이거 안넣어주면 오류남
          count = 0;
          for (int i = 0; i < snapshot.data.size; i++) {
            if (snapshot.data.docs[i].data()['상태'] == '제작완료') {
              count++;
              // _showNotification();
            }
          }
         _arry[indx++ % 2] = count;
         if( _arry[indx % 2] != _arry[(indx + 1) % 2]){
           _showNotification();
         }

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
        });
  }

  Future<void> _showNotification() async {
    var android = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);

    var ios = IOSNotificationDetails();
    var detail = NotificationDetails(android, ios);

    await _flutterLocalNotificationsPlugin.show(
      0,
      '새로운 주문 안내',
      '새로운 주문이 왔습니다.',
      detail,
      payload: '비카주',
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
