import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

Widget calendarPage(int index) {
  final controller = WriteController.to;
  return wrapScrollTag(
      index: index,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("calendar_title".tr, style: TextStyle(fontSize: 20)),
        SizedBox(height: 12),
        Obx(() =>Container(
            child:TableCalendar(
                  availableGestures: AvailableGestures.all,
                  daysOfWeekHeight: 35,
                  //locale: 'ko-KR',
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: controller.focusedDay.value,
                  headerStyle: HeaderStyle(
                      titleCentered: true, formatButtonVisible: false),

                  calendarStyle: CalendarStyle(
                      defaultDecoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(20)),
                      weekendTextStyle: TextStyle(color: Colors.red),
                      weekendDecoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(20)),
                      holidayTextStyle: TextStyle(color: Colors.red),
                      markersMaxCount: 30,
                      outsideDecoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(20)),
                      selectedDecoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.lightGrey),
                      selectedTextStyle:
                          TextStyle(color: Colors.blueAccent, fontSize: 16)),
                  selectedDayPredicate: (day) {
                    return controller.selectedDays.value.contains(day);
                    // return isSameDay(
                    //     controller.selectedDay.value, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) =>
                      controller.onDaySelected(selectedDay, focusedDay),
                  calendarBuilders: calendarBuilder(),
                )))
      ]));
}

CalendarBuilders calendarBuilder() {
  Widget borderTextCommon(String text, Color color,DateTime date) {
    return GestureDetector(
      onTap: () =>WriteController.to.onWeekSelected(date),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: Container(
            decoration: BoxDecoration(
              color: WriteController.to.weekToggle[date.weekday-1].value?Colors.grey:Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.9))),
            child: Center(
                child:
                    Text(text, style: TextStyle(color: color, fontSize: 16)))),
      ),
    );
  }

  return CalendarBuilders(
    dowBuilder: (context, day) {
      switch (day.weekday) {
        case 1:
          return borderTextCommon('월', Colors.black,day);
        case 2:
          return borderTextCommon('화', Colors.black,day);
        case 3:
          return borderTextCommon('수', Colors.black,day);
        case 4:
          return borderTextCommon('목', Colors.black,day);
        case 5:
          return borderTextCommon('금', Colors.black,day);
        case 6:
          return borderTextCommon('토', Colors.blue,day);
        case 7:
          return borderTextCommon('일', Colors.red,day);
      }
    },
    holidayBuilder: (context,day,___){
      if(DateFormat('EEEE').format(day) == "Saturday"){
        print('aaaaa');
      }
    }

  );
}
