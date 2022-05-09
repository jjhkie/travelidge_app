

import '../model/notice.dart';

abstract class Repository{

  //get
  Future<List<Notice>> getNoticeList();
  //patch
  //Future<String> patchCompleted(Notice notice);
  Future<String> patchCompleted(String no);
  //put
  Future<String> putCompleted(Notice notice);
  //delete
  Future<String> deleteNotice(Notice notice);
  //post
  Future<String> postNotice(Notice notice);

  Future<String> postNotices(title,contents);
}