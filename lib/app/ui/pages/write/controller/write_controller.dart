import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/destination_bottom_sheet.dart';

class WriteController extends GetxController {
  static WriteController get to => Get.find<WriteController>();

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

  RxBool scrollType = false.obs;//자동 스크롤 || 수동 스크롤 판단
  var scrollController = ScrollController().obs;
  var counter = 0.obs;
  var seenPage = 0.obs;

  /** key */
  RxList<GlobalKey> listKey = List.generate(8, (index) => GlobalKey()).obs;
  RxList<GlobalKey> positionKey = List.generate(8, (index) => GlobalKey()).obs;
  GlobalKey bottomKey = GlobalKey();

  resetData() {
    scrollTap.value = List.generate(8, (index) => false.obs).obs;
    writeComplete.value = List.generate(8, (index) => false.obs).obs;
    scrollTap[0].value = true;
    writeComplete[0].value = true;
    counter.value = 0;
    paddingWidgetValue.value = 152;
  }

  /** bottomSheet 변수*/
  RxBool bottomState = true.obs;

  /** 높이 계산 변수*/
  RxDouble paddingWidgetValue = 0.0.obs;
  RxDouble paddingHalfValue = 0.0.obs;

  RxDouble insideHeightValue = 0.0.obs;

  RxList<Rx<bool>> scrollTap = List.generate(8, (index) => false.obs).obs;
  RxList<Rx<bool>> writeComplete = List.generate(8, (index) => false.obs).obs;

  var maxCounter = 7;
  RxInt totalCounter = 0.obs;

  @override
  void onInit() {
    print('onInit');
    scrollTap.value = List.generate(8, (index) => false.obs).obs;
    writeComplete.value = List.generate(8, (index) => false.obs).obs;
    scrollTap[0].value = true;
    writeComplete[0].value = true;
    paddingWidgetValue.value = 152;
    super.onInit();

    /** 스크롤할 때*/
    scrollController.value.addListener(() {

      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        bottomState.value = true;
      } else {
        bottomState.value = false;
      }
      if (!scrollType.value && scrollTap.value.contains(true)) {
        Future.delayed(Duration(milliseconds: 100), () {
          scrollTap[counter.value].value = false;
        });
      }
    });
  }

  @override
  void dispose() {
    print('dispose');

    scrollController.value.dispose();
    super.dispose();
  }

  /**key 를 사용한 크기 측정*/
  getSize(int index) {
    GlobalKey key = listKey[index];
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size.height;
    }
  }
  getPosition(int index) {
    GlobalKey key = listKey[index];
    if (key.currentContext != null) {
      final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      return position.dy;
    }
  }

  /** key 값에 따라 스크롤 이동 */
  keyValueScroll(int index) {

    Future.delayed(Duration(milliseconds:700), () {

      print('00000');
      print(scrollController.value.position.pixels+getPosition(index));
      scrollController.value.animateTo(
          //scrollInsideValue.value+insideHeightValue.value,
        scrollController.value.position.pixels-110+getPosition(index-1)+insideHeightValue.value,
        duration: Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn
      );
    });

    Future.delayed(Duration(milliseconds: 3000), () {
      scrollType.value = false;
    });
  }

  /** 스크롤 제일 하단으로 이동*/
  downScroll() {
    Future.delayed(Duration(milliseconds: 200), () {
      scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOut);
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      scrollType.value = false;
    });
  }
  /** 스크롤 제일 상단으로 이동*/
  upScroll() {
    Future.delayed(Duration(milliseconds: 200), () {
      scrollController.value.animateTo(
          scrollController.value.position.minScrollExtent,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOut);
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      scrollType.value = false;
    });
  }

  widgetClickCounter(int index) {

    scrollType.value = true;
    //위젯 half height
    paddingHalfValue.value = getSize(index - 1) / 2;
    paddingWidgetValue.value = getSize(index);
    if(index ==0){
      scrollTap[counter.value].value = false; //800
      counter.value = index;
      scrollTap[index].value = true;
      upScroll();
    }else{
      insideHeightValue.value = ((getPosition(index)-getPosition(index-1))/2.0).abs();
      scrollTap[index].value = true;
      scrollTap[counter.value].value = false; //800
      counter.value = index;

      if(writeComplete.lastIndexOf(true) == index){
        downScroll();
      }else{
        keyValueScroll(index);
      }
    }
  }

  /** counter 는 특정 위젯을 보여주기 위한 변수*/
  /** showtalCount 는 lastIndexOf값으로 변경 가능*/
  nextCounter() {
    /** counter 의 값에 마지막 index 값 저장 */
    if (counter.value != writeComplete.lastIndexOf(true)) {
      scrollTap[counter.value].value = false;
      counter.value = writeComplete.lastIndexOf(true);
    }
    scrollType.value = true; //scroll 감지 막기
    /** 다음 버튼 클릭 시 실행되는 기본 코드 */
    if (seenPage.value != maxCounter) {
      paddingHalfValue.value = getSize(counter.value) / 2;
      paddingWidgetValue.value = getSize(counter.value + 1);
      scrollTap[counter.value + 1].value = true;//800
      Future.delayed(Duration(milliseconds: 200), () {
        writeComplete[counter.value + 1].value = true;
        scrollTap[counter.value].value = false;
        counter.value++;
        seenPage.value++;
        downScroll();
      });
      /** 마지막 페이지 작성 후 버튼 클릭 시 실행되는 코드*/
    } else {
      scrollTap[counter.value].value = false;
      scrollController.value.animateTo(
          scrollController.value.position.minScrollExtent,
          duration: Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn);
      seenPage.value++;
    }
  }

  RxString bottomSheetDe = '목적지'.obs;
  RxBool leadTimeDay = true.obs;
  RxBool timeDayConference = false.obs;

  RxInt maxPeople = 1.obs;

  RxBool priceChoice = true.obs;
  RxBool priceConference = false.obs;

  destinationClick(index) {
    bottomSheetDe.value = location[index];
    Get.back();
  }

  destinationToggle() {
    Get.bottomSheet(DestinationBottomSheet());
  }

  leadTimeToggle(String TD) {
    if (TD == 'time' && leadTimeDay.value == false) {
      leadTimeDay.value = !leadTimeDay.value;
    } else if (TD == 'day' && leadTimeDay.value == true) {
      leadTimeDay.value = !leadTimeDay.value;
    }
  }

  timeDayConferenceToggle() {
    timeDayConference.value = !timeDayConference.value;
  }

  peopleAdd() {
    maxPeople++;
  }

  peopleremove() {
    if (maxPeople > 1) {
      maxPeople--;
    }
  }

  priceConferenceToggle() {
    priceConference.value = !priceConference.value;
  }

  priceToggle(String Pr) {
    if (Pr == 'free' && priceChoice == false) {
      priceChoice.value = !priceChoice.value;
      priceConference.value = false;
    } else if (Pr == 'pay' && priceChoice == true) {
      priceChoice.value = !priceChoice.value;
    }
  }

  prevPage() {
    Get.reset();
    Get.back();

    //resetData();
  }
}
