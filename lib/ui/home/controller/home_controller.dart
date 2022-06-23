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
  }

  /**appbar 변수*/
  var startWidth = Get.width; //기기 width
  late ScrollController scrollController;
  var appbarSize = AppBar().preferredSize.height;
  var globalOffsetValue = 0.0.obs;
  var valueScroll = ValueNotifier<double>(0);
  RxBool visibleHeader = false.obs;

  /**json 정보 가져오기*/
  getData() {
    _repository.getHomeData().then((data) {
      popular.value = data.home.popularLocal;
      friend.value = data.home.friend;
      recent.value = data.home.recentTravel;
      category.value = data.home.category;
    });
  }
}
