import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/data/model/notice.dart';
import 'package:travelidge/app/data/repository/notice_repository.dart';


class NoticeController extends GetxController{
  final NoticeRepository _repository;

  NoticeController(this._repository);


  var scrollController = ScrollController().obs;
  var noticeList = <Notice>[].obs;

  @override
  void onInit(){
    //getNoticeAll();
    super.onInit();
  }


  getNoticeAll(){
    _repository.getNoticeAll().then((data){
      this.noticeList.value = data;
      print('---------------------------------------');
      print(noticeList);
    });
  }


}
