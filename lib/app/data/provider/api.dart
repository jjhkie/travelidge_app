
import 'package:http/http.dart' as http;
import 'package:travelidge/app/data/model/home_model.dart';
import 'dart:convert';
import 'package:travelidge/app/data/model/notice.dart';
import 'package:travelidge/app/data/model/travel_model.dart';


final base_url = 'http://118.67.131.249';

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
   * travel 정보 가져오기
   * **/
  getScrollAll(nextNo) async {
    var response = await http.get(Uri.parse(
        '$base_url/v1/api/myTravels/20?travelNo=$nextNo&countPerPage=10'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return travel.fromJson(jsonData);
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
