import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/model/home_model.dart';
import 'package:travelidge/data/repository/home_repository.dart';
import 'package:travelidge/ui/home/components/appbar/calendar_bottom_sheet.dart';
import 'package:travelidge/ui/home/components/appbar/location_bottom_sheet.dart';

class HomeController extends GetxController {
  HomeController(this._repository);

  final HomeRepository _repository;
  var popular = <PopularLocal>[].obs;
  var friend = <Friend>[].obs;
  var recent = <RecentTravel>[].obs;
  var category = <Category>[].obs;

  final location = [
    '서울',
    '경기도',
    '강원도',
    '충청남도',
    '충청북도',
    '부산',
    '대구',
    '인천',
    '광주',
    '대전',
    '울산',
    '강원도',
    '전라남도',
    '전라북도',
    '경상북도',
    '경상남도',
    '제주도'
  ];
  RxString bottomSheetLo = '목적지'.obs;


  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  /**appbar 변수*/
  var startWidth = Get.width; //기기 width
  late ScrollController scrollController; //Home scroll controller

  /** toggle button */
  RxList<Rx<bool>> selection_1 = [true.obs, true.obs, true.obs].obs;
  RxList<Rx<bool>> selection_2 = [
    true.obs,
    true.obs,
    true.obs,
    true.obs,
    true.obs,
    true.obs,
    true.obs
  ].obs;

  /** 목적지 입력*/
  locationClick(index){
    bottomSheetLo.value = location[index];
    Get.back();
  }

  functionToggleChange(index) {
    selection_1[index].value = !selection_1[index].value;
  }

  genreToggleChange(index) {
    selection_2[index].value = !selection_2[index].value;
  }

  /**json 정보 가져오기*/
  getData() {
    _repository.getHomeData().then((data) {
      popular.value = data.home.popularLocal;
      friend.value = data.home.friend;
      recent.value = data.home.recentTravel;
      category.value = data.home.category;
    });
  }

  /**BottomSheet  */
  void BottomSheet(String division) {
    switch (division) {
      case 'location':
        Get.bottomSheet(LocationBottomSheet());
        break;
      case 'calendar':
        Get.bottomSheet(CalendarBottomSheet());
    }
  }
}
