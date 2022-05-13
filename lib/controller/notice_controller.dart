import 'package:travelidge/model/notice.dart';
import 'package:travelidge/repository/notice_repository.dart';


class NoticeController {
  final NoticeRepository _repository;

  NoticeController(this._repository);

  //get
  Future<dynamic> getData() async {
    return _repository.getData();
  }

  //delete
  Future<String> deleteNotice(Notice notice) async {
    return _repository.deleteNotice(notice);
  }

}
