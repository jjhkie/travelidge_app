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

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  /**appbar 변수*/
  var startWidth = Get.width; //기기 width
  late ScrollController scrollController;//Home scroll controller





  /** toggle button */
  //List<RxBool> selections3 = <RxBool>[false,false,true].obs;
  RxList<Rx<bool>> selection_1 = [true.obs, true.obs, true.obs].obs;
  RxList<Rx<bool>> selection_2 = [true.obs, true.obs, true.obs, true.obs, true.obs, true.obs, true.obs].obs;

  functionToggleChange(index){
    selection_1[index].value = !selection_1[index].value;
  }

  genreToggleChange(index){
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
    switch(division){
      case 'location':
        Get.bottomSheet(LocationBottomSheet());
        break;
      case 'calendar':
        Get.bottomSheet(CalendarBottomSheet());
    }

  }
}
