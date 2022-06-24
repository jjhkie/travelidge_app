import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBottomSheet extends StatelessWidget {
  const CalendarBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      child: Container(
        height: 800,
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            children: [
              const Center(
                child: Text('얼마나 여행하세요'),
              ),
              Expanded(
                child: TableCalendar(
                    lastDay: DateTime(2022, 12, 31),
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2022, 1, 1)),
              ),
              const SizedBox(height: 10),
              _sheetButton('확인', Colors.grey,Colors.black,Get.back),
              const SizedBox(height: 2),
              _sheetButton('나중에 하기',Colors.white,Colors.grey, Get.back),
            ],
          ),
        ),
      ),
    );
  }

  /** button */
  Widget _sheetButton(String label,Color boxColor,Color textColor, VoidCallback onPre) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: boxColor,
          minimumSize: const Size.fromHeight(50)),
      onPressed: onPre,
      child: Text(label,style: TextStyle(color: textColor)),
    );
  }
}
