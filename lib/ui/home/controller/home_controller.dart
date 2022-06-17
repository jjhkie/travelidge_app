import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/model/home_model.dart';
import 'package:travelidge/data/repository/home_repository.dart';

class HomeController extends GetxController {
  HomeController(this._repository);

  final HomeRepository _repository;
  var popular = <PopularLocal>[].obs;
  var friend = <Friend>[].obs;
  var recent = <RecentTravel>[].obs;
  var category = <Category>[].obs;



  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_listenToScrollChange);

    scrollControllerItemHeader = ScrollController();

  }
  void _listenToScrollChange(){
    if(scrollController.offset < 130){
      globalOffsetValue.value = scrollController.offset;
    }else{
      globalOffsetValue.value = 0;
    }

  }


  /**appbar 변수*/
  var startWidth = Get.width; //기기 width
  late ScrollController scrollController;
  var appbarSize = AppBar().preferredSize.height;
  var globalOffsetValue = 0.0.obs;
  var valueScroll = ValueNotifier<double>(0);
  RxBool visibleHeader = false.obs;

  //삭제
  late List<double> listOffsetItemHeader = [];
  late ScrollController scrollControllerItemHeader;


  getData() {
    _repository.getHomeData().then((data) {
      this.popular.value = data.home.popularLocal;

      print('---popular---');
      print(popular);
      this.friend.value = data.home.friend;
      this.recent.value = data.home.recentTravel;
      this.category.value = data.home.category;
    });
  }

  void colorChange(activation){
      activation = !activation;
  }


}
