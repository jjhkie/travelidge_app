import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:travelidge/app/ui/pages/write/components/destination_bottom_sheet.dart';

class WriteController extends GetxController {
  static WriteController get to => Get.find<WriteController>();

  @override
  void onInit() {
    autoController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(Get.context!).padding.bottom),
        axis: Axis.vertical);
    autoController.addListener(() {
      print('aaaa');
    });
    super.onInit();
  }
  @override
  void dispose() {
    autoController.dispose();
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

  var deviceHeight = Get.height;
  final context = Get.context!;
  var contextHeight = Get.context!.height - 100;

  /** scroll to index test*/
  late AutoScrollController autoController;


  var counter = 0.obs;
  var maxCounter = 7;

  RxBool scrollType = false.obs;

  nextCounter() {
    counter = counter++;
    print(counter);
    if (counter.value > maxCounter) {
      counter.value = 0;
      scrollType.value = true;
      print(scrollType.value);
    }
    autoController.scrollToIndex(counter.value,
        preferPosition: AutoScrollPosition.begin);
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

  /** */


  void moveScroll() {
    // final positionkey = _getPosition(globalKey_1);
    // print(positionkey.dy);
    //  Scrollable.ensureVisible(
    //      globalKey_1.currentContext!, duration: Duration(seconds: 1),curve:Curves.fastOutSlowIn);
    // //Sc.animateTo(positionkey.dy,curve: Curves.fastOutSlowIn, duration: Duration(seconds: 1));
    // //categoryRegiter.value = true;
    //     print(categoryRegiter.value);
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

  _getPosition(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      return position;
    }
  }
}
