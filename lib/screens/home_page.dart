import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  var text = [''];

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _homeTopBt(),
        SizedBox(height: 2),
        FutureBuilder<List<dynamic>>(
          future: getlist(),
          builder: (context, snapshot) {

            var data1 = snapshot.data![1];
            print('---------------------------');
            print('---------------------------');
            print(data1);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); //로딩 애니메이션
            }

            //에러가 발생한 경우 반환되는 부분
            if (snapshot.hasError) {
              return Center(child: Text('error'));
            }
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _homeList(snapshot,0),
                  _homeList(snapshot,1),
                  _homeList(snapshot,2),
                ],
              )

            );
          },
        ),
      ],
    );
  }
}

//상단 버튼
Widget _homeTopBt() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(child: Text('검색'), onPressed: () {}),
            SizedBox(width: 20),
            ElevatedButton(child: Text('알람'), onPressed: () {})
          ],
        )
      ],
    ),
  );
}

//리스트 및 버튼
Widget _homeList(snapshot, int a) {
  return Column(
    children: <Widget>[
      ElevatedButton(onPressed: () {}, child: Text('최근 등록된 여행')),
      SizedBox(height: 2),
      Container(
        height:50,
        child: ListView.separated(
          itemCount: snapshot.data![a].length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (context, int index) {
            return Divider(thickness: 1);
          },
          itemBuilder: (context, int index) {
            var popular = snapshot.data![a][index];
            return Container(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Text('${popular['localNo']}')),
                  Expanded(flex: 1, child: Text('${popular['preTitle']}')),
                ],
              ),
            );
          },

        ),
      )
    ],
  );
}

Future<List<dynamic>> getlist() async {
  var url = Uri.parse('http://118.67.131.249/v1/api/home');
  var response = await http.get(url);
  String toutf = utf8.decode(response.bodyBytes);
  //한글깨짐
  var body = jsonDecode(toutf);
  List<dynamic> result = [
    body['homeList']['popularLocalList'],
    body['homeList']['recentTravelList'],
    body['homeList']['categoryList'],
    body['homeList']['friendList'],
  ];
  return result;
}
