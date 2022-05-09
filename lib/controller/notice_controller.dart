import 'package:travelidge/model/notice.dart';
import 'package:travelidge/repository/repository.dart';


class NoticeController {
  final Repository _repository;

  NoticeController(this._repository);

  //get
  Future<List<Notice>> getNoticeList() async {
    return _repository.getNoticeList();
  }

  //patch
  Future<String> fetchNoticeList(String No) async{
    return _repository.patchCompleted(No);
  }

  //delete
  Future<String> deleteNotice(Notice notice) async {
    return _repository.deleteNotice(notice);
  }

  //post
  Future<String> postNotice(Notice notice) async{
    return _repository.postNotice(notice);

  }

  //post
  Future<String> postNotices(String title,String content) async{
    return _repository.postNotices(title, content);

  }
}
