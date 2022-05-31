import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';
import 'package:travelidge/data/model/home_model.dart';
import 'package:travelidge/ui/home/widgets/category_item.dart';
import 'package:travelidge/ui/home/widgets/friend_item.dart';
import 'package:travelidge/ui/home/widgets/popular_item.dart';
import 'package:travelidge/ui/home/widgets/recent_item.dart';

class home extends GetView<HomeController> {
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
            future: controller.getData(),
            builder: (context, snapshot) {
              var data = snapshot.data?.home;

              final popularLocalList = data?.popularLocal;
              final recentTravelList = data?.recentTravel;
              final categoryTravelList = data?.category;
              final friendTravelList = data?.friend;

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
