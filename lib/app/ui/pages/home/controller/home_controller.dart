import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/data/model/home_model.dart';
import 'package:travelidge/app/data/repository/home_repository.dart';
import 'package:travelidge/app/ui/pages/home/components/home_components.dart';
class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();
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
  RxBool sectionAll = true.obs;
  RxList<Rx<bool>> selection_1 = [true.obs, true.obs, true.obs].obs;
  RxList<Rx<bool>> selection_2 = List.generate(6, (index) => false.obs).obs;


  /** 목적지 입력*/
  locationClick(index){
    bottomSheetLo.value = location[index];
    Get.back();
  }

  /** 기능별 카테고리 버튼 이벤트*/
  functionToggleChange(index) {
    if(selection_1[index].value == true && selection_1.where((i) => i == true.obs).length ==1){
      snackBarEvent();
    }else{
      selection_1[index].value = !selection_1[index].value;
    }
  }

  /** 장르별 카테고리 버튼 이벤트*/
  genreToggleChange(index) {
    if(sectionAll.value == true){
      sectionAll.value = false;
      selection_2[index].value = !selection_2[index].value;
    }else{
      if(selection_2[index].value == true && selection_2.where((i) => i == true.obs).length ==1){
        snackBarEvent();
      }else{
        selection_2[index].value = !selection_2[index].value;
      }

    }
  }

  /** 스낵바 이벤트*/
  void snackBarEvent(){
    Get.closeAllSnackbars();
    Get.snackbar( 'Error',
      '하나는 선택해야합니다.',
      snackPosition: SnackPosition.BOTTOM,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,);
  }


  /** 전체 버튼 이벤트*/
  allToggleButton(){
    if(sectionAll.value ==false){
      selection_2.value = List.generate(6, (index) => false.obs).obs;
      sectionAll.value = true;
    }
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
