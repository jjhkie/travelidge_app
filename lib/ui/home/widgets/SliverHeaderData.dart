import 'package:flutter/material.dart';

class SliverHeaderData extends StatelessWidget {
  const SliverHeaderData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Text(
          "언제 어디로 떠나세요?",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        //날짜 및 위치
        Row(
          children: [

          ],
        ),
        const SizedBox(height: 6),
        const SizedBox(height: 20),
        Row(
          children: [
            ButtonCustom('현지인 상품', 0xFFFFFFCC, 0xFFFFCC99),
            SizedBox(width: 10),
            ButtonCustom('같이가요', 0xFFFFCCCC, 0xFFFF6666),
            SizedBox(width: 10),
            ButtonCustom('현지인 요청', 0xFFE5CCFF, 0xFFFF66FF)
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            ButtonCustom('전체', 0xFFE0E0E0, 0xFF808080),
            SizedBox(width: 10),
            ButtonCustom('액티비티', 0xFFE0E0E0, 0xFF808080),
            SizedBox(width: 10),
            ButtonCustom('이색체험', 0xFFE0E0E0, 0xFF808080),
            SizedBox(width: 10),
            ButtonCustom('맛집', 0xFFE0E0E0, 0xFF808080),
            SizedBox(width: 10),
          ],
        ),
      ]),
    );
  }

  Widget ButtonCustom(title, color, TextColor) {
    return ElevatedButton(
      child: Text('$title',
          style:
              TextStyle(color: Color(TextColor), fontWeight: FontWeight.bold)),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: Color(color)),
    );
  }
}
