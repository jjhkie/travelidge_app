import 'package:flavor/flavor.dart';
import 'package:http/http.dart' as http;
import 'package:travelidge/data/model/home_model.dart';
import 'dart:convert';

import 'package:travelidge/data/model/notice.dart';
import 'package:travelidge/data/model/travel_model.dart';

final base_url = Flavor.I.getString(Keys.apiUrl);

class ApiClient {
  /**
   * notice 정보 가져오기
   * **/
  getNoticeAll() async {
    await Future.delayed(Duration(seconds: 2));
    var response = await http.get(Uri.parse('$base_url/v1/api/notices'));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return body.map<Notice>((json) => Notice.fromJson(json)).toList();
    } else
      print('error');
  }

  /**
   * 여행 페이지 totalCount 가져오기
   * **/
  getPageInfo() async {
    var response = await http.get(Uri.parse('$base_url/v1/api/myTravels/7'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      var pageInfo = jsonData['pageInfo']['totalCount'];
      print(pageInfo);
      return pageInfo;
    }else{
      print('error');
    }
  }

  /**
   * 페이징에 필요한 정보 가져오기
   * **/
  getScrollAll(countPerPage) async {
    await Future.delayed(Duration(seconds: 2));
    var response = await http.get(Uri.parse(
        '$base_url/v1/api/myTravels/7?travelNo=0&countPerPage=$countPerPage'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      var traveldata = jsonData['myTravelList'];

      return traveldata
          .map<MyTravelList>((json) => MyTravelList.fromJson(json))
          .toList();
    }else{
      print('error');
    }
  }
  /**
   * 메인 화면 정보 가져오기
   * **/
  getHomeData() async{
    var response = await http.get(Uri.parse('$base_url/v1/api/home'));
    if(response.statusCode ==200){
      String toutf = utf8.decode(response.bodyBytes);
      var body = jsonDecode(toutf);

      return HomeListModel.fromJson(body);
    }

  }
}
