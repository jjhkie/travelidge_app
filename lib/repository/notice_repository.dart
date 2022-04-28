import 'dart:convert';

import 'package:flavor/flavor.dart';
import 'package:http/http.dart' as http;
import 'package:travelidge/model/notice.dart';
import 'package:travelidge/repository/repository.dart';

class NoticeRepository implements Repository {



  /**
   * delete
   * */
  @override
  Future<String> deleteNotice(Notice notice) async {
    //http://118.67.131.249/v1/api/notices/[삭제할 no]
    var url = Uri.parse('${Flavor.I.getString(Keys.apiUrl)}/v1/api/notices/${notice.noticeNo}');
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
    List<Notice> noticeList = [];
    //http://118.67.131.249/v1/api/notices

    print('${Keys.apiUrl}');
    var url = Uri.parse('${Flavor.I.getString(Keys.apiUrl)}/v1/api/notices');
    print(url);
    print('===================');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body); //convert

    //parse
    for (var i = 0; i < body.length; i++) {
      noticeList.add(Notice.fromJson(body[i]));
    }

    return noticeList;
  }

  //patch
  @override
  Future<String> patchCompleted(Notice notice) async {
    var url = Uri.parse('${Flavor.I.getString(Keys.apiUrl)}/v1/api/notices/${notice.noticeNo}');

    String resData = '';

    return resData;
  }

  @override
  Future<String> postNotice(Notice notice) {
    // TODO: implement postNotice
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Notice notice) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }
}
