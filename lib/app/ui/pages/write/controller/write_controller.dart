import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travelidge/app/ui/pages/write/components/destination_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });
final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 6, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 6, kToday.day);

class WriteController extends GetxController {
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
  RxBool scrollType = false.obs;
  var scrollController = ScrollController().obs;
  late RxList<Rx<bool>> scrollTap;
  late RxList<Rx<bool>> writeComplete;
  var counter = 0.obs;

  /** 카테고리 버튼 */
  late RxList<Rx<bool>> categoryButton =
      List.generate(6, (index) => false.obs).obs;
  int buttonIndex = 0;

  /** 글작성 완료 변수*/
  RxBool pageFinal = false.obs;
  var maxCounter = 7;
  var keyboardInsetBottom = 0.obs;

  /** Title Text Controller */
  late TextEditingController titleTextController;

  /** LeadTime Text Controller*/
  late TextEditingController timeTextController;
  TextEditingController nightTextController = TextEditingController();
  TextEditingController dayTextController = TextEditingController();
  FocusNode timeFocus = FocusNode();
  FocusNode nightFocus = FocusNode();
  FocusNode dayFocus = FocusNode();

  /** Calendar */

  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rxn<DateTime?> selectedDay = Rxn<DateTime>();

  //late DateTime? selectedDay;

  final Rx<LinkedHashSet<DateTime>> selectedDays =
      LinkedHashSet<DateTime>(equals: isSameDay, hashCode: getHashCode).obs;

  //final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);

  /** */
  void onDaySelected(DateTime selected, DateTime focused) {
    //focusedDay.value = DateTime.now(); //필요한가
    focusedDay.value = focused;
    // Update values in a Set
    if (selectedDays.value.contains(selected)) {
      selectedDays.value.remove(selected);
      if (weekToggle[selected.weekday - 1].value == true) {
        weekToggle[selected.weekday - 1].value = false;
      }
    } else {
      if (selectedDays.value.length < 30) {
        selectedDays.value.add(selected);
        if (weekToggle[selected.weekday - 1].value == false) {
          int subDay;
          if (selected.day % 7 == 0) {
            subDay = ((selected.day ~/ 7) - 1) * 7;
          } else {
            subDay = (selected.day ~/ 7) * 7;
          }

          var choiceDayFirstWeek = selected.subtract(Duration(days: subDay));

          checkContain(choiceDayFirstWeek);
        }
      }
      print('30개가 넘었습니다.');
    }
  }

  checkContain(DateTime firstDay){
    bool containDay = false;
    var nextDay = firstDay;
    while(nextDay.month - firstDay.month == 0){
      if(selectedDays.value.contains(nextDay)){
        containDay = true;
        nextDay = nextDay.add(Duration(days:7));
      }else{
        containDay = false;
        break;
      }
    }
    weekToggle[firstDay.weekday - 1].value = containDay;
  }

  RxList<Rx<bool>> weekToggle = List.generate(7, (index) => false.obs).obs;

  void onWeekSelected(DateTime date) {
    weekToggle[date.weekday - 1].value = !weekToggle[date.weekday - 1].value;
    print(DateFormat('EEEE').format(date));
    var choiceWeekFirstDay = date;
    if (weekToggle[date.weekday - 1].value) {
      if (date.day > 10) {
        /** 첫 번째 주가 저번 달인 경우 */

        choiceWeekFirstDay = date.add(Duration(days: 7)); //

        while (choiceWeekFirstDay.month - date.month == 1) {
          focusedDay.value = choiceWeekFirstDay;
          if (!selectedDays.value.contains(choiceWeekFirstDay)) {
            if (selectedDays.value.length == 30) {
              checkContain(choiceWeekFirstDay);
              break;
            }
            selectedDays.value.add(choiceWeekFirstDay);
          }
          choiceWeekFirstDay = choiceWeekFirstDay.add(Duration(days: 7));
        }
      } else {
        while (choiceWeekFirstDay.month - date.month == 0) {
          focusedDay.value = choiceWeekFirstDay;
          if (selectedDays.value.length == 30) {
            checkContain(choiceWeekFirstDay);
            break;
          }
          selectedDays.value.add(choiceWeekFirstDay);
          choiceWeekFirstDay = choiceWeekFirstDay.add(Duration(days: 7));
        }
      }
    } else {
      if (date.day > 10) {
        /** 첫 번째 주가 저번 달인 경우 */
        choiceWeekFirstDay = date.add(Duration(days: 7)); //

        while (choiceWeekFirstDay.month - date.month == 1) {
          focusedDay.value = choiceWeekFirstDay;
          if (selectedDays.value.contains(choiceWeekFirstDay)) {
            selectedDays.value.remove(choiceWeekFirstDay);
          }
          choiceWeekFirstDay = choiceWeekFirstDay.add(Duration(days: 7));
        }
      } else {
        while (choiceWeekFirstDay.month - date.month == 0) {
          focusedDay.value = choiceWeekFirstDay;
          selectedDays.value.remove(choiceWeekFirstDay);
          choiceWeekFirstDay = choiceWeekFirstDay.add(Duration(days: 7));
        }
      }
    }
  }

  repeatSelected(DateTime choiceWeekFirstDay) {}

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  final kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(_kEventSource);

  List<Event> _getEventsForDays(Set<DateTime> days) {
    // Implementation example
    // Note that days are in selection order (same applies to events)
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  @override
  void onInit() {
    super.onInit();

    scrollTap = List.generate(8, (index) => false.obs).obs;
    writeComplete = List.generate(8, (index) => false.obs).obs;
    scrollTap[0].value = true;
    writeComplete[0].value = true;
    paddingWidgetValue.value = 152;
    titleTextController = TextEditingController();
    timeTextController = TextEditingController();
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
          FocusManager.instance.primaryFocus?.unfocus();
        });
      }
    });
  }

  /** 뒤로가기 두번클릭 */
  DateTime? currentBackPressTime;

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar('경고', '한번 더 누르면 페이지가 종료됩니다.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(milliseconds: 2000));
    } else {
      Get.closeAllSnackbars();
      Get.offAllNamed('/');
    }
  }

  focusChange(hasFocus) {
    keyboardInsetBottom.value = 0;
  }

  focusUp(hasFocus) {
    keyboardInsetBottom.value = 50;
  }

  @override
  void dispose() {
    super.dispose();
  }

  /**카테고리 버튼 기능 */
  categoryButtonEvent(int index) {
    categoryButton[buttonIndex].value = false;
    categoryButton[index].value = true;
    buttonIndex = index;
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
    Future.delayed(Duration(milliseconds: 700), () {
      scrollController.value.animateTo(
          scrollController.value.position.pixels -
              110 +
              getPosition(index - 1) +
              insideHeightValue.value,
          duration: Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn);
    });

    scrollLastFun(1400);
  }

  /** */
  scrollLastFun(time) {
    Future.delayed(Duration(milliseconds: time), () {
      scrollType.value = false;
      effectiveCheck.value = false;
      if (counter.value == 1) {
        titleFocus.requestFocus();
      } else if (counter.value == 4) {
        if (leadTimeDay.value == true) {
          timeFocus.requestFocus();
        } else {
          nightFocus.requestFocus();
        }
      } else if (counter.value == 7) {
        contentFocus.requestFocus();
      }
    });
  }

  /** 스크롤 제일 하단으로 이동*/
  downScroll(int time) {
    Future.delayed(Duration(milliseconds: time), () {
      scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent + 60,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOut);
    });

    scrollLastFun(time + 1250);
  }

  /** 스크롤 제일 상단으로 이동*/
  upScroll() {
    Future.delayed(Duration(milliseconds: 200), () {
      scrollController.value.animateTo(
          scrollController.value.position.minScrollExtent,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOut);
    });

    scrollLastFun(1500);
  }

  /** 스크롤 유효성 확인*/
  RxBool effectiveCheck = false.obs;

  /** Price Text Controller*/
  TextEditingController priceTextController = TextEditingController();
  FocusNode priceFocus = FocusNode();

  /** Content Text Controller*/
  TextEditingController contentTextController = TextEditingController();
  FocusNode contentFocus = FocusNode();

  /** type 에 따른 실행*/
  typeEffective(type) {
    if (type == 'next') {
      nextCounter();
    } else if (type == 'scroll') {
      effectiveCheck.value = true;
    } else if (type == 'topTouch') {
      widgetClickCounter(counter.value - 1);
    }
  }

  /** snackbar */
  snackBarEffective(title, content) {
    Get.closeAllSnackbars();
    Get.snackbar(title, content);
  }

  /** 유효성 검사 코드*/
  effectiveFunc(type) {
    effectiveCheck.value = false;
    switch (counter.value) {
      case 0:
        if (categoryButton.value.contains(true)) {
          typeEffective(type);
        } else {
          snackBarEffective('버튼', '하나라도 선택해주세요');
        }
        break;
      case 1:
        if (titleTextController.text.isEmpty) {
          snackBarEffective('제목', '제목을 입력해주세요');
        } else {
          typeEffective(type);
          //titleFocus.requestFocus();
        }
        break;
      case 2:
        if (bottomSheetDe.value != '목적지') {
          typeEffective(type);
        } else {
          snackBarEffective('목적지', '목적지를 선택해주세요');
        }
        break;
      case 3:
        typeEffective(type);
        break;
      case 4:
        if (leadTimeDay.value) {
          if (timeTextController.text.isEmpty) {
            snackBarEffective('시간', '시간을 작성해주세요');
            timeFocus.requestFocus();
          } else {
            typeEffective(type);
          }
        } else {
          if (nightTextController.text.isEmpty) {
            snackBarEffective('기간', '기간을 작성해주세요');
            nightFocus.requestFocus();
          } else if (dayTextController.text.isEmpty) {
            snackBarEffective('기간', '기간을 작성해주세요');
            dayFocus.requestFocus();
          } else if (int.parse(nightTextController.text) >=
              int.parse(dayTextController.text)) {
            snackBarEffective('x', '기간을 제대로 적으세요');
          } else if (int.parse(dayTextController.text) -
                  int.parse(nightTextController.text) >
              2) {
            snackBarEffective('x', '제대로 적으세요');
          } else {
            typeEffective(type);
          }
        }
        break;
      case 5:
        typeEffective(type);
        break;
      case 6:
        if (priceChoice.value) {
          typeEffective(type);
        } else {
          if (priceTextController.text.isEmpty) {
            snackBarEffective('x', '가격을 적어주세요');
          } else if (priceTextController.text[0] == 0) {
            print('0dld');
          } else {
            typeEffective(type);
          }
        }
        break;
      case 7:
        if (contentTextController.text.isEmpty) {
          snackBarEffective('x', '계획을 작성해주세요');
        } else {
          typeEffective(type);
        }
        break;
      case 8:
        effectiveCheck.value = true;
        break;
    }
  }

  widgetClickCounter(int index) {
    scrollType.value = true;

    paddingWidgetValue.value = getSize(index);
    if (index == 0) {
      paddingHalfValue.value = getSize(index + 1) / 2;
      scrollTap[counter.value].value = false; //800
      counter.value = index;
      scrollTap[index].value = true;
      upScroll();
    } else {
      paddingHalfValue.value = getSize(index - 1) / 2;
      insideHeightValue.value =
          ((getPosition(index) - getPosition(index - 1)) / 2.0).abs();
      scrollTap[index].value = true;

      if (index != counter.value) {
        scrollTap[counter.value].value = false; //800
        counter.value = index;
      }

      if (writeComplete.lastIndexOf(true) == index) {
        downScroll(1050);
      } else {
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
      paddingHalfValue.value = getSize(counter.value) / 2;
      paddingWidgetValue.value = getSize(counter.value + 1);
      scrollTap[counter.value + 1].value = true; //800
      Future.delayed(Duration(milliseconds: 200), () {
        writeComplete[counter.value + 1].value = true;
        scrollTap[counter.value].value = false;
        counter.value++;
        downScroll(400);
      });
      /** 마지막 페이지 작성 후 버튼 클릭 시 실행되는 코드*/
    } else {
      effectiveCheck.value = true;
      scrollTap[counter.value].value = false;
      upScroll();
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
    if (counter.value == writeComplete.lastIndexOf(true)) {
      nextCounter();
    }
  }

  destinationToggle() {
    Get.bottomSheet(DestinationBottomSheet());
  }

  leadTimeToggle(String TD) {
    if (TD == 'time' && leadTimeDay.value == false) {
      print('타입');
      timeDayConference.value = false;
      leadTimeDay.value = !leadTimeDay.value;
      timeTextController.clear();
    } else if (TD == 'day' && leadTimeDay.value == true) {
      timeDayConference.value = false;
      leadTimeDay.value = !leadTimeDay.value;
      nightTextController.clear();
      dayTextController.clear();
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
      if (priceTextController.text.isEmpty) {
        effectiveCheck.value = false;
      }
      priceTextController.clear();
      priceChoice.value = !priceChoice.value;
      priceFocus.requestFocus();
    }
  }

  prevPage() {
    onWillPop();
  }
}
