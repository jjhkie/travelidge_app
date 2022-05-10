import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travelidge/model/home.dart';

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
            final popularLocalList = snapshot.data?.homeList?.popularLocalList;
            final recentTravelList = snapshot.data?.homeList?.recentTravelList;
            final categoryList = snapshot.data?.homeList?.categoryList;
            final friendList = snapshot.data?.homeList?.friendList;

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
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('지금 인기 지역')),
                        ),
                        SizedBox(height: 2),
                        Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: popularLocalList!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return Container(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Stack(
                                        children: [
                                          _backgroundImage(popularLocalList,index),
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                    '${popularLocalList[index].preTitle}'),
                                                Text(
                                                    '${popularLocalList[index].postTitle}'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10)
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('최근 등록된 여행')),
                        ),
                        SizedBox(height: 2),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: recentTravelList?.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return Container(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Stack(
                                        children: [
                                          _backgroundImage(recentTravelList, index),
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                    '${recentTravelList![index].title}'),
                                                Text(
                                                    '${recentTravelList[index].type}'),
                                                Text(
                                                    '${recentTravelList[index].partyCount} /${recentTravelList[index].partyMaxCount} ')
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10)
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('카테고리별 여행')),
                        ),
                        SizedBox(height: 2),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: categoryList!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return Container(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Stack(
                                        children: [
                                          _backgroundImage(categoryList, index),
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                    '${categoryList[index].title}'),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10)
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('친구한 로컬민')),
                        ),
                        SizedBox(height: 2),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: friendList!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              var popular = friendList[index];
                              return Container(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Stack(
                                        children: [
                                          _backgroundImage(friendList, index),
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                    '${friendList[index].travelDto?.title}'),
                                                Text(
                                                    '${friendList[index].travelDto?.type}'),
                                                Text(
                                                    '${friendList[index].travelDto?.partyCount} /${friendList[index].travelDto?.partyMaxCount} ')

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10)
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                    //----
                  ],
                ));
          },
        ),
      ],
    );
  }
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
