import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/destination_bottom_sheet.dart';

class WriteController extends GetxController with GetSingleTickerProviderStateMixin{
  static WriteController get to => Get.find<WriteController>();
  var context = Get.context;
  /** TextField Focus */
  FocusNode titleFocus = FocusNode();
  RxBool titleFocusPadding = false.obs;

  /** 목적지 목록 */
  final location = List.generate(16, (index) => 'destination$index'.tr);

  /** key */
  RxList<GlobalKey> listKey = List.generate(8, (index) => GlobalKey()).obs;

  /** bottomSheet 상태 관리 변수*/
  RxBool bottomState = true.obs;

  /** 높이 계산 변수*/
  RxDouble paddingWidgetValue = 0.0.obs;
  RxDouble paddingHalfValue = 0.0.obs;
  RxDouble insideHeightValue = 0.0.obs;

  /** 스크롤 관련 변수*/
  RxBool scrollType = false.obs;//자동 스크롤 || 수동 스크롤 판단
  var scrollController = ScrollController().obs;
  late RxList<Rx<bool>> scrollTap;
  late RxList<Rx<bool>> writeComplete;
  var counter = 0.obs;

  /** 카테고리 버튼 */
  late RxList<Rx<bool>> categoryButton = List.generate(6, (index) => false.obs).obs;
  int buttonIndex = 0;

  /** 글작성 완료 변수*/
  RxBool pageFinal = false.obs;

  var maxCounter = 7;


  var keyboardInsetBottom = 0.obs;

  @override
  void onInit() {
    super.onInit();
/**
    titleFocus.addListener(() {
      if(titleFocus.hasFocus){
        keyboardInsetBottom.value = 100;
      }else{
        keyboardInsetBottom.value = 0;
      }
      print('focus');

    });
 */

    scrollTap = List.generate(8, (index) => false.obs).obs;
    writeComplete = List.generate(8, (index) => false.obs).obs;
    scrollTap[0].value = true;
    writeComplete[0].value = true;
    paddingWidgetValue.value = 152;


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

  focusChange(hasFocus){
    print(hasFocus);
    print('focus change');
    keyboardInsetBottom.value = 0;
  }
  focusUp(hasFocus){
    print(hasFocus);
    print('focus change');
    keyboardInsetBottom.value = 100;
  }
  @override
  void dispose() {
    scrollController.value.dispose();
    super.dispose();
  }

 /**카테고리 버튼 기능 */
  categoryButtonEvent(int index){
    categoryButton[buttonIndex].value = false;
    categoryButton[index].value = true;
    buttonIndex = index;
  }


  /**key 를 사용한 크기 측정*/
  getSize(int index) {
    print('getSize');
    GlobalKey key = listKey[index];
    print(index);
    print(key.currentContext);
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size.height;
    }
  }
  /**key 를 사용한 위젯 위치 측정*/
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
      print(scrollController.value.position.pixels+getPosition(index));
      scrollController.value.animateTo(
        scrollController.value.position.pixels-110+getPosition(index-1)+insideHeightValue.value,
        duration: Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn
      );
    });

    Future.delayed(Duration(milliseconds: 1400), () {
      scrollType.value = false;
    });
  }

  /** 스크롤 제일 하단으로 이동*/
  downScroll(int time) {
    Future.delayed(Duration(milliseconds: time), () {
      scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent+60,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOut);
    });

    Future.delayed(Duration(milliseconds: time+1250), () {
      if(counter.value ==1){
        titleFocus.requestFocus();
      }
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

    paddingWidgetValue.value = getSize(index);
    if(index ==0){
      paddingHalfValue.value = getSize(index +1) / 2;
      scrollTap[counter.value].value = false; //800
      counter.value = index;
      scrollTap[index].value = true;
      upScroll();
    }else{
      paddingHalfValue.value = getSize(index - 1) / 2;
      insideHeightValue.value = ((getPosition(index)-getPosition(index-1))/2.0).abs();
      scrollTap[index].value = true;

      if(index != counter.value){
        scrollTap[counter.value].value = false; //800
        counter.value = index;
      }

      if(writeComplete.lastIndexOf(true) == index){
        downScroll(650);
      }else{
        keyValueScroll(index);
      }
    }
  }


  /** showtalCount 는 lastIndexOf값으로 변경 가능*/
  nextCounter() {
    FocusManager.instance.primaryFocus?.unfocus();
    /** counter 의 값에 마지막 index 값 저장 */
    if (counter.value != writeComplete.lastIndexOf(true)) {
      scrollTap[counter.value].value = false;
      counter.value = writeComplete.lastIndexOf(true);
    }
    scrollType.value = true; //scroll 감지 막기
    /** 다음 버튼 클릭 시 실행되는 기본 코드 */
    if (writeComplete.lastIndexOf(true) != maxCounter) {
      print(counter.value);
      paddingHalfValue.value = getSize(counter.value)/2;
      print(counter.value);
      paddingWidgetValue.value = getSize(counter.value + 1);
      scrollTap[counter.value + 1].value = true;//800
      Future.delayed(Duration(milliseconds: 200), () {
        writeComplete[counter.value + 1].value = true;
        scrollTap[counter.value].value = false;
        counter.value++;

        downScroll(400);
      });
      /** 마지막 페이지 작성 후 버튼 클릭 시 실행되는 코드*/
    } else {
      scrollTap[counter.value].value = false;
      scrollController.value.animateTo(
          scrollController.value.position.minScrollExtent,
          duration: Duration(milliseconds: 800),
          curve: Curves.linear);
      pageFinal.value = true;
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
      timeDayConference.value = false;
      leadTimeDay.value = !leadTimeDay.value;
    } else if (TD == 'day' && leadTimeDay.value == true) {
      timeDayConference.value = false;
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
    Get.back();
    //resetData();
  }
}
