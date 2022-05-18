import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/model/travel_model.dart';
import 'package:travelidge/data/repository/user_repository.dart';

class InfiniteScrollController extends GetxController {
  final UserRepository _repository;

  InfiniteScrollController(this._repository);

  var scrollController = ScrollController().obs; //리스트뷰의 상태를 감지하기 위한
  var travel = <MyTravelList>[].obs;
  RxInt countPerPage = 10.obs;
  RxInt totalCount = 0.obs;
  var isLoading = false.obs; //로딩중 확인
  var hasMore = false.obs; // 다음 데이터 존재 여부 확인

  //컨트롤러가 생성될 떄 호출
  @override
  void onInit() {
    _getTotalCount();
    _getData();

    //변화가 감지되었을 때 position값을 이용해 보여진 정보의 가장 마지막 행에 도달했는지 확인
    //마지막 행에 도달했을 경우 _getData()가 실행
    this.scrollController.value.addListener(() {
      if (this.scrollController.value.position.pixels ==
              this.scrollController.value.position.maxScrollExtent &&
          this.hasMore.value) {

        _getData();

      }
    });
    super.onInit();
  }

  _getTotalCount() async {
    _repository.getPageInfo().then((data){
      totalCount.value =data;;
    });
  }

  _getData() async {
    isLoading.value = true;
    if(hasMore.value && totalCount.value < countPerPage.value){
        countPerPage.value = totalCount.value-1;
    }
    _repository.getScrollAll(countPerPage).then((data) {

      isLoading.value = false;
      travel.value = data;

      hasMore.value = travel.length < totalCount.value-1;
      countPerPage += 10;
    });
  }

  reload() async {
    isLoading.value = true;
    travel.clear();
    countPerPage =10.obs;
    _getTotalCount();
    _getData();
    await Future.delayed(Duration(seconds: 2));

  }
}

