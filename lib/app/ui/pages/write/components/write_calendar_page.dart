import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';
import 'package:intl/date_symbol_data_local.dart';

Widget calendarPage(int index) {
  final controller = WriteController.to;
  return wrapScrollTag(
      index: index,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("calendar_title".tr, style: TextStyle(fontSize: 20)),
        SizedBox(height: 12),
        Container(
          child: TableCalendar(
            availableGestures: AvailableGestures.all,
            daysOfWeekHeight: 35,

            //locale: 'ko-KR',
            firstDay: DateTime.utc(2000, 01, 01),
            lastDay: DateTime.utc(2050, 12, 31),
            focusedDay: DateTime.now(),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false
            ),

            calendarStyle: CalendarStyle(
                defaultDecoration: BoxDecoration(
                    border: Border.all(width: 1,color:Colors.grey.withOpacity(0.9)),
                    borderRadius: BorderRadius.circular(20)),
                weekendTextStyle: TextStyle(color: Colors.red),
                weekendDecoration: BoxDecoration(
                    border: Border.all(width: 1, color:Colors.grey.withOpacity(0.9)),
                    borderRadius: BorderRadius.circular(20)),
                holidayTextStyle: TextStyle(color: Colors.red),
                markersMaxCount: 30,
                outsideDecoration: BoxDecoration(
                  border:Border.all(width:1, color:Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20)
                ),
                selectedTextStyle:
                    TextStyle(color: Colors.blueAccent, fontSize: 50)),
            onDaySelected: (selectedDay, focusedDay) {
              print(focusedDay);
            },
            calendarBuilders: calendarBuilder(),

            // headerVisible: false,
            //builders:calendarBuilder()
          ),
        )
      ]));
}
CalendarBuilders calendarBuilder() {

  Widget borderTextCommon(String text,Color color){
    return GestureDetector(
      onTap: (){print('aaa');},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color:Colors.grey.withOpacity(0.9))
          ),
            child: Center(child: Text(text,style: TextStyle(color:color,fontSize: 16)))
        ),
      ),
    );
  }

  return CalendarBuilders(
    dowBuilder: (context, day){
      switch(day.weekday){
        case 1:
          return borderTextCommon('월',Colors.black);
        case 2:
          return borderTextCommon('화',Colors.black);
        case 3:
          return borderTextCommon('수',Colors.black);
        case 4:
          return borderTextCommon('목',Colors.black);
        case 5:
          return borderTextCommon('금',Colors.black);
        case 6:
          return borderTextCommon('토',Colors.blue);
        case 7:
          return borderTextCommon('일',Colors.red);
      }
    },
    selectedBuilder: (context, date, _) {
      print('aaa');
    },
  );
}
