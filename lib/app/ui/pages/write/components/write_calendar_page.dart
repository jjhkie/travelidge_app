import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

Widget calendarPage(int index) {
  final controller = WriteController.to;
  return wrapScrollTag(
      index: index,
      child: Obx(() =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("calendar_title".tr, style: TextStyle(fontSize: 20)),
            Text(controller.selectedDays.value.length.toString()),
            SizedBox(height: 12),
            Container(
                child: TableCalendar(
              availableGestures: AvailableGestures.all,
              daysOfWeekHeight: 35,
              locale: 'ko-KR',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: controller.focusedDay.value,
              headerStyle:
                  HeaderStyle(titleCentered: true, formatButtonVisible: false),
              calendarStyle: CalendarStyle(
                  holidayTextStyle: TextStyle(color: Colors.red),
                  markersMaxCount: 30),
              selectedDayPredicate: (day) {
                return controller.selectedDays.value.contains(day);
                // return isSameDay(
                //     controller.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) =>
                  controller.onDaySelected(selectedDay, focusedDay),
              calendarBuilders: calendarBuilder(),
            ))
          ])));
}

CalendarBuilders calendarBuilder() {
  Widget borderTextCommon(String text, Color color, DateTime date) {
    return GestureDetector(
      onTap: () => WriteController.to.onWeekSelected(date),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: Container(
            decoration: BoxDecoration(
                color: WriteController.to.weekToggle[date.weekday - 1].value
                    ? Colors.grey
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.9))),
            child: Center(
                child:
                    Text(text, style: TextStyle(color: color, fontSize: 16)))),
      ),
    );
  }

  Widget dayBorder(DateTime day, Color textColor,Color color, Color borderColor){
    return Center(
      child: Container(
          width: 42,
          height: 35,
          decoration: BoxDecoration(
              color:color,
              border: Border.all(
                  width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(20)),

          child: Center(
            child: Text(
              '${day.day}',
              style: TextStyle(color: textColor),
            ),
          )),
    );
  }

  return CalendarBuilders(
    todayBuilder: ((_,day,___){
      return dayBorder(day, Colors.black,Colors.transparent,Colors.grey.withOpacity(0.5));
    }),
    dowBuilder: (context, day) {
      switch (day.weekday) {
        case 1:
          return borderTextCommon('월', Colors.black, day);
        case 2:
          return borderTextCommon('화', Colors.black, day);
        case 3:
          return borderTextCommon('수', Colors.black, day);
        case 4:
          return borderTextCommon('목', Colors.black, day);
        case 5:
          return borderTextCommon('금', Colors.black, day);
        case 6:
          return borderTextCommon('토', Colors.blue, day);
        case 7:
          return borderTextCommon('일', Colors.red, day);
      }
    },
    outsideBuilder: ((_, day, ___){
      return dayBorder(day, Colors.grey.withOpacity(0.3),Colors.transparent,Colors.grey.withOpacity(0.3));
    }),

    selectedBuilder: ((_, day, ___){
      if (day.weekday == DateTime.saturday) {
        return dayBorder(day, Colors.blue,Colors.grey.withOpacity(0.6),Colors.grey.withOpacity(0.9));
      } else if (day.weekday == DateTime.sunday) {
        return dayBorder(day, Colors.red,Colors.grey.withOpacity(0.6),Colors.grey.withOpacity(0.9));
      } else {
        return dayBorder(day, Colors.black,Colors.grey.withOpacity(0.6),Colors.grey.withOpacity(0.9));
      }
    }),
    defaultBuilder: ((_, day, ___) {
      if (day.weekday == DateTime.saturday) {
        return dayBorder(day, Colors.blue,Colors.transparent,Colors.grey.withOpacity(0.5));
      } else if (day.weekday == DateTime.sunday) {
        return dayBorder(day, Colors.red,Colors.transparent,Colors.grey.withOpacity(0.5));
      } else {
        return dayBorder(day, Colors.black,Colors.transparent,Colors.grey.withOpacity(0.5));
      }
    }),

  );


}
