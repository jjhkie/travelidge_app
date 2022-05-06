
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class declare extends StatefulWidget {

  @override
  State<declare> createState() => _declareState();
}

class _declareState extends State<declare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getlist(),
        builder: (context, snapshot) {
          print(snapshot.data![0][1]['localNo']);
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection :Axis.horizontal,
                      itemCount: snapshot.data![0].length,
                      itemBuilder: (BuildContext context,int index) {
                        return Text(snapshot.data![0][index].toString());
                      }),
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ListView.builder(
                      itemCount: snapshot.data![1].length,
                      scrollDirection :Axis.horizontal,
                      itemBuilder: (BuildContext context,int index) {
                        return Text(snapshot.data![1][index].toString());
                      }),
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ListView.builder(
                      itemCount: snapshot.data![2].length,
                      scrollDirection :Axis.horizontal,
                      itemBuilder: (BuildContext context,int index) {
                        return Text(snapshot.data![2][index].toString());
                      }),
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ListView.builder(
                      itemCount: snapshot.data![3].length,
                      scrollDirection :Axis.horizontal,
                      itemBuilder: (BuildContext context,int index) {
                        return Text(snapshot.data![3][index].toString());
                      }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('에러');
          } else {
            return Center(child: Text('로딩중'));
          }
        },
      ),
    );
  }

  Future<List<dynamic>> getlist() async {
    var url = Uri.parse('http://118.67.131.249/v1/api/home');
    var response = await http.get(url);
    String toutf = utf8.decode(response.bodyBytes);
    //한글깨짐
    var body = jsonDecode(toutf);
    List<dynamic> result = [body['homeList']['popularLocalList'],body['homeList']['recentTravelList'],body['homeList']['categoryList'],body['homeList']['friendList'],];
    return result;
  }
}
