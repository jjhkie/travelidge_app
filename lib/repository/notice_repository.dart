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
    var url = Uri.parse('$base_url/v1/api/notices/${notice.noticeNo}');
    final response = await http.delete(url);
    return json.decode(response.body);
  }

  /**
   * list
   * */
  Future<List<Notice>> getData() async {
    var url = Uri.parse('$base_url/v1/api/notices');
    var response = await http.get(url);
    var body = json.decode(response.body);
    return body.map<Notice>((json) => Notice.fromJson(json)).toList();
  }
}
