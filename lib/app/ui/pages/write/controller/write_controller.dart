import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/destination_bottom_sheet.dart';

class WriteController extends GetxController {
  static WriteController get to => Get.find<WriteController>();

  var scrollController = ScrollController().obs;
  var secondController = ScrollController().obs;

  /** 해당 부분을 이용하여 스크롤 기능 분리
   * https://docs.flutter.dev/release/breaking-changes/default-scroll-behavior-drag
   * */
  var dfdd = PointerDeviceKind.touch;

  @override
  void onInit() {
    scrollController.value.addListener(() {
      print('aa');
    });

    super.onInit();
  }

  @override
  void dispose() {
    scrollController.value.dispose();
    super.dispose();
  }

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

  final context = Get.context!;
  var width = Get.context!.width;

  /** scroll to index test*/

  RxList<Rx<bool>> scrollTap = [
    true.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ].obs;

  RxList<Rx<bool>> writeComplete = [
    true.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ].obs;

  var counter = 0.obs;
  var maxCounter = 7;

  RxBool scrollType = false.obs;

  /** key를 이용한 스크롤 이동 */
  RxList<GlobalKey> listKey = List.generate(8, (index) => GlobalKey()).obs;
  GlobalKey bottomKey = GlobalKey();
  /** key 값에 따라 스크롤 이동 */
  delayScroll() {
    print('start');
    Future.delayed(Duration(milliseconds: 300), () {
      Scrollable.ensureVisible(listKey[counter.value].currentContext!,
          duration: Duration(seconds: 1));
      print('end');
    });
  }

  /** 스크롤 제일 하단으로 이동*/
  downScroll() {
    // Future.delayed(Duration(milliseconds: 400),(){
    //   scrollController.value.animateTo(
    //       scrollController.value.position.maxScrollExtent,
    //       duration: Duration(milliseconds: 800),
    //       curve: Curves.fastOutSlowIn);
    // });
    Future.delayed(Duration(milliseconds: 400), () {
      Scrollable.ensureVisible(bottomKey.currentContext!,
          duration: Duration(seconds: 1));
      print('end');
    });
  }

  nextCounter() {

    if(counter.value < maxCounter){
      scrollTap[counter.value + 1].value = true;
      Scrollable.ensureVisible(listKey[counter.value+1].currentContext!,
          duration: Duration(seconds: 800));
      Future.delayed(Duration(milliseconds: 100), () {
        writeComplete[counter.value].value = true;
        scrollTap[counter.value].value = false;
        counter++;
      });
      downScroll();
    }else{
      writeComplete[counter.value].value = true;
      scrollTap[counter.value].value = false;
      scrollController.value.animateTo(
          scrollController.value.position.minScrollExtent,
          duration: Duration(milliseconds: 800),
          curve:Curves.fastOutSlowIn
      );
      counter.value = 0;
      scrollType.value = true;
      print(scrollType.value);
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
      Get.back();
  }
}
