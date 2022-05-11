import 'dart:convert';
import 'package:flavor/flavor.dart';
import 'package:http/http.dart' as http;
import 'package:travelidge/model/notice.dart';

class NoticeRepository {



  final base_url = Flavor.I.getString(Keys.apiUrl);
  /**
   * delete
   * */
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
  Future<List<Notice>> getData() async {
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
  }

 
}
