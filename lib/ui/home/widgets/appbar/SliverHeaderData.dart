import 'package:flutter/material.dart';

class SliverHeaderData extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right:16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('logo',style:TextStyle(color:Colors.black,fontSize:20)),
            Row(
              children: [
                Icon(Icons.search,color:Colors.black),
                SizedBox(width: 20),
                Icon(Icons.notifications_none,color: Colors.black)
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Text(
          "언제 어디로 떠나세요?",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        //날짜 및 위치
        Row(
          children: [
            //위치
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
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
                                  children: [
                                    Expanded(
                                        flex: 1, child: Icon(Icons.search)),
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
                              SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.all(8.0),
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      child: Expanded(
                                        child: Text('목적지 $index'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      primary: Colors.black,
                                      minimumSize: const Size.fromHeight(50)),
                                  onPressed: () {},
                                  child: Text('확인')),
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
                      Expanded(
                          flex: 4,
                          child: Container(
                            child: Text('제주', style: TextStyle(fontSize: 18)),
                          ))
                    ],
                  ),
                ),
              ),
            )),
            SizedBox(width: 10),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 20),
                          child: Column(
                            children: [
                              Container(
                                  child: Center(
                                child: Text('얼마나 여행하세요'),
                              )),
                              SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.all(8.0),
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      child: Expanded(
                                        child: Text('목적지 $index'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      primary: Colors.black,
                                      minimumSize: const Size.fromHeight(50)),
                                  onPressed: () {},
                                  child: Text('확인')),
                              SizedBox(height: 2),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: Colors.white,
                                    minimumSize: const Size.fromHeight(50)),
                                onPressed: () {},
                                child: Text('나중에 하기'),
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
                      Expanded(
                          flex: 4,
                          child: Container(
                            child: Text('6/23 - 6/31',
                                style: TextStyle(fontSize: 18)),
                          ))
                    ],
                  ),
                ),
              ),
            )),
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
        SizedBox(height: 1),
        Container(
          height: 40,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.horizontal,
            children: <Widget>[

              ButtonCustom('전체', 0xFFE0E0E0, 0xFF808080),
              SizedBox(width: 10),
              ButtonCustom('액티비티', 0xFFE0E0E0, 0xFF808080),
              SizedBox(width: 10),
              ButtonCustom('이색체험', 0xFFE0E0E0, 0xFF808080),
              SizedBox(width: 10),
              ButtonCustom('맛집', 0xFFE0E0E0, 0xFF808080),
              SizedBox(width: 10),
              ButtonCustom('맛집', 0xFFE0E0E0, 0xFF808080),
              SizedBox(width: 10),
              ButtonCustom('맛집', 0xFFE0E0E0, 0xFF808080),
              SizedBox(width: 10),
            ],
          ),
        ),
      ]),
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
