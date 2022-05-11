import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travelidge/controller/home_controller.dart';
import 'dart:convert';

import 'package:travelidge/model/home.dart';
import 'package:travelidge/repository/home_repository.dart';
import 'package:travelidge/screens/home/category/category_item.dart';
import 'package:travelidge/screens/home/friend/friend_item.dart';
import 'package:travelidge/screens/home/popular/popular_item.dart';
import 'package:travelidge/screens/home/recent/recent_item.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  var Controller = HomeController(HomeRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true, // 스크롤을 내렸을 때 앱바가 남아 있을 것이냐
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.access_alarm),
                color: Colors.black,
                onPressed: () {}),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          FutureBuilder<HomeListModel>(
            future: Controller.getData(),
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
                    ],
                  ));
            },
          ),
        ]))
      ],
    ));
  }
}

Future<HomeListModel> getlist() async {
  var url = Uri.parse('http://118.67.131.249/v1/api/home');
  var response = await http.get(url);
  String toutf = utf8.decode(response.bodyBytes);
  //한글깨짐
  var body = jsonDecode(toutf);

  return HomeListModel.fromJson(body);
}
