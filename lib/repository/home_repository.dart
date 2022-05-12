import 'package:travelidge/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRepository{

  Future<HomeListModel> getData() async{
    var url = Uri.parse('http://118.67.131.249/v1/api/home');
    var response = await http.get(url);
    String toutf = utf8.decode(response.bodyBytes);
    //한글깨짐
    var body = jsonDecode(toutf);

    return HomeListModel.fromJson(body);
  }
}