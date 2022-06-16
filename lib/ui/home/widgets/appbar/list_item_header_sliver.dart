
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';

class ListItemHeaderSliver extends StatelessWidget {
  ListItemHeaderSliver({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;
//  final controller = Get.put(SliverScrollController());

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_arrow_down), onPressed: () {  },
            ),
            SizedBox(width:3),
            ButtonCustom('상품', 0xFFFFFFCC,0xFFFFCC99),
            SizedBox(width: 3),
            ButtonCustom('같이', 0xFFFFCCCC,0xFFFF6666),
            SizedBox(width: 3),
            ButtonCustom('요청', 0xFFE5CCFF,0xFFFF66FF),
            SizedBox(width: 5),
            ButtonCustom('액티비티', 0xFFE0E0E0,0xFF808080),
            SizedBox(width: 3),
            ButtonCustom('박물관/전시', 0xFFE0E0E0,0xFF808080),
            SizedBox(width: 3),
            ButtonCustom('이색체험',0xFFE0E0E0,0xFF808080),
            SizedBox(width: 3),
            ButtonCustom('맛집', 0xFFE0E0E0,0xFF808080),
            SizedBox(width: 3),
          ],

        ),

      )
    );
  }

  Widget ButtonCustom(title, color,TextColor) {
    return ElevatedButton(
      child: Text('$title',style: TextStyle(color: Color(TextColor),fontWeight: FontWeight.bold)),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: Color(color)),
    );
  }
}
