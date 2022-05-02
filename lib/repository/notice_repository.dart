import 'dart:convert';

import 'package:flavor/flavor.dart';
import 'package:http/http.dart' as http;
import 'package:travelidge/model/notice.dart';
import 'package:travelidge/repository/repository.dart';

class NoticeRepository implements Repository {



  final base_url = Flavor.I.getString(Keys.apiUrl);
  /**
   * delete
   * */
  @override
  Future<String> deleteNotice(Notice notice) async {
    //http://118.67.131.249/v1/api/notices/[삭제할 no]
    var url = Uri.parse('$base_url/v1/api/notices/${notice.noticeNo}');
    print(Keys.apiUrl);
    final response = await http.delete(url);
    print(response.statusCode);
    print('===================');
    print(response.body);
    return json.decode(response.body);
  }

  /**
   * list
   * */
  @override
  Future<List<Notice>> getNoticeList() async {
    //List<Notice> noticeList = [];
    //http://118.67.131.249/v1/api/notices

    print('${Keys.apiUrl}');
    var url = Uri.parse('$base_url/v1/api/notices');
    print('url ------$url');
    print('===================');
    var response = await http.get(url);
    print('response ------$response');
    print('status code : ${response.statusCode}');

    //var body = json.decode(response.body).cast<Map<String, dynamic>>();

    var body = json.decode(response.body);

    return body.map<Notice>((json) => Notice.fromJson(json)).toList();

    //var body = json.decode(response.body); //convert

    //parse
    // for (var i = 0; i < body.length; i++) {
    //   noticeList.add(Notice.fromJson(body[i]));
    // }

    //return noticeList;
  }

  //patch
  @override
  Future<String> patchCompleted(String no) async {
    print(no);
    var url = Uri.parse('$base_url/v1/api/notices/$no');

    var response = await http.get(url);
    print(response);
    var body = json.decode(response.body);
    print(body);

    //TODO 정보 찾기 but, 화면 출력 필요
    return ' ';

  }

  @override
  Future<String> postNotice(Notice notice) async{

    var url = Uri.parse('$base_url/v1/api/notices/${notice.noticeNo}');
    final response = await http.post(url);
    print('post------------------');
    print(response);
    print(response.body);
    return json.encode(response.body);

  }

  @override
  Future<String> putCompleted(Notice notice) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }

  @override
  Future<String> postNotices(title, contents) async{
    var url = Uri.parse('$base_url/v1/api/notices?noticeNo=0');

    final response = await http.post(url,body:{
      'title':title,
      'contents':contents
    });

    print('---------post');
    print('status code : ${response.statusCode}');
    if(response.statusCode ==200){
      var body = json.decode(response.body);
      print('---------post');
      print(body);
      return body;
    }
    return '';
  }

 
}
