import 'package:flutter/material.dart';
import 'map_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',//제목
      theme: ThemeData(//테마
        primarySwatch: Colors.blue,//파랑 계열의 색상테마가 설정
      ),
      home: MapSample(),//실제 앱이 표시하는 위젯
    );
  }
}
