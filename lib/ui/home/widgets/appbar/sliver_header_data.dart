import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:table_calendar/table_calendar.dart";
import 'package:travelidge/ui/home/controller/home_controller.dart';

class SliverHeaderData extends StatelessWidget {
  const SliverHeaderData({Key? key,required this.controller}) : super(key: key);
  final HomeController controller;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        /** Logo & Icon */
        _mainAppbar(),
        const SizedBox(height: 20),
        const Text(
          "언제 어디로 떠나세요?",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        //날짜 및 위치
        Row(
          children: [
            /** location ui  & bottom Sheet */
            _locationBox(context),

            const SizedBox(width: 10),

            /**calendar ui $ bottom Sheet */
            _calendarBox(context),
          ],
        ),
        const SizedBox(height: 26),
        Row(
          children: [
            ButtonCustom('현지인 상품', 0xFFFFFFCC, 0xFFFFCC99),
            const SizedBox(width: 10),
            ButtonCustom('같이가요', 0xFFFFCCCC, 0xFFFF6666),
            const SizedBox(width: 10),
            ButtonCustom('현지인 요청', 0xFFE5CCFF, 0xFFFF66FF)
          ],
        ),
        const SizedBox(height: 1),
        SizedBox(
          height: 40,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.horizontal,
            children: <Widget>[

              ButtonCustom('전체', 0xFFFFFFCC, 0xFFFFFFCC),
              const SizedBox(width: 10),
              ButtonCustom('액티비티', 0xFFE0E0E0, 0xFF808080),
              const SizedBox(width: 10),
              ButtonCustom('이색체험', 0xFFE0E0E0, 0xFF808080),
              const SizedBox(width: 10),
              ButtonCustom('맛집', 0xFFE0E0E0, 0xFF808080),
              const SizedBox(width: 10),
              ButtonCustom('맛집', 0xFFE0E0E0, 0xFF808080),
              const SizedBox(width: 10),
              ButtonCustom('맛집', 0xFFE0E0E0, 0xFF808080),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ]),
    );
  }

  /** getx  적용 중*/
  Widget BarCategoryButton(title,color,textColor,bool activation){
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Text('$title',style: TextStyle(color: activation?Color(color) :  Colors.grey),),
      ),
      onTap: (){
        controller.colorChange(activation);
      },
    );
  }

  Widget ButtonCustom(title, color, TextColor) {
    return ElevatedButton(
      child: Text('$title',
          style: TextStyle(
              color: Color(TextColor),
              fontSize: 15,
              fontWeight: FontWeight.bold)),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: Color(color)),
    );
  }
}

/** Logo & Icon */
Widget _mainAppbar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text('logo', style: TextStyle(color: Colors.black, fontSize: 20)),
      Row(
        children: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 20),
          Icon(Icons.notifications_none, color: Colors.black)
        ],
      )
    ],
  );
}

/** location ui & bottomSheet*/
Widget _locationBox(context) {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
    child: GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return Container(
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: const [
                          Expanded(flex: 1, child: Icon(Icons.search)),
                          Expanded(
                            flex: 9,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '어디로 떠나세요?'),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 50,
                            child: Expanded(
                              child: Text('목적지 $index'),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            primary: Colors.black,
                            minimumSize: const Size.fromHeight(50)),
                        onPressed: () {},
                        child: const Text('확인')),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.grey.withOpacity(0.7),
                ))),
            const Expanded(
                flex: 4, child: Text('제주', style: TextStyle(fontSize: 18)))
          ],
        ),
      ),
    ),
  ));
}

Widget _calendarBox(context) {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
    child: GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return Container(
              height: 800,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
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
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            primary: Colors.black,
                            minimumSize: const Size.fromHeight(50)),
                        onPressed: () {},
                        child: const Text('확인')),
                    const SizedBox(height: 2),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          primary: Colors.white,
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {},
                      child: const Text(
                        '나중에 하기',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.grey.withOpacity(0.7),
                ))),
            const Expanded(
                flex: 4,
                child: Text('6/23 - 6/31', style: TextStyle(fontSize: 18)))
          ],
        ),
      ),
    ),
  ));
}
