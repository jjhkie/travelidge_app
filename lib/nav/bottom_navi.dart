import 'package:flutter/material.dart';
import 'package:travelidge/screens/declare_page.dart';
import 'package:travelidge/screens/writing_page.dart';
import 'package:travelidge/screens/home/home_page.dart';
import 'package:travelidge/screens/notice_page.dart';
import 'package:travelidge/screens/user_page.dart';
import 'package:flavor/flavor.dart';

void setupApp() {
  if (Flavor.I.isDevelopment) {
    Flavor.I.getString(Keys.apiUrl);
  }
  runApp(FlavorApp());
}

class FlavorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travelidege',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOption = <Widget>[
    home(),
    declare(),
    notice(),
    writing(),
    user()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetOption.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,//item 이 4개 이상인 경우 추가.
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: '여행등록'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: '여행글'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '마이페이지'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightGreen,

          onTap: _onItemTapped),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
