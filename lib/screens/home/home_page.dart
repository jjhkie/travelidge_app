import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travelidge/model/home.dart';
import 'package:travelidge/screens/home/category/category_item.dart';
import 'package:travelidge/screens/home/friend/friend_item.dart';
import 'package:travelidge/screens/home/popular/popular_item.dart';
import 'package:travelidge/screens/home/recent/recent_item.dart';

class home extends StatefulWidget {
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
        FutureBuilder<HomeListModel>(
          future: getlist(),
          builder: (context, snapshot) {

            var data = snapshot.data?.homeList;

            final popularLocalList = data?.popularLocalList;
            final recentTravelList = data?.recentTravelList;
            final categoryTravelList = data?.categoryList;
            final friendTravelList = data?.friendList;

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
                    popularList(popularLocalList),
                    SizedBox(height: 30),
                    recentList(recentTravelList),
                    SizedBox(height: 30),
                    categoryList(categoryTravelList),
                    SizedBox(height: 30),
                    friendList(friendTravelList)
                    //----
                  ],
                ));
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

Future<HomeListModel> getlist() async {
  var url = Uri.parse('http://118.67.131.249/v1/api/home');
  var response = await http.get(url);
  String toutf = utf8.decode(response.bodyBytes);
  //한글깨짐
  var body = jsonDecode(toutf);

  return HomeListModel.fromJson(body);
}
//이미지 로딩
Widget _backgroundImage(data,index){
  return Container(
    child: Image.network(
      '${data![index].thumbnailUrl}',
      errorBuilder:
          (context, url, error) =>
          Container(
            child: Image.network(
                'http://www.gapyeongnow.kr/news/photo/201406/5584_5678_3211.jpg'),
          ),
    ),
  );
}