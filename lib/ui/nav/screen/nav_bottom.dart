import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/nav/controller/nav_controller.dart';
import 'package:travelidge/ui/chat_list/views/chat_list_view.dart';
import 'package:travelidge/ui/home/screen/home_page.dart';
import 'package:travelidge/ui/notice/screen/notice_page.dart';
import 'package:travelidge/ui/user/screen/user_page.dart';
import 'package:travelidge/ui/write/writing_page.dart';

class page extends GetView<NavController> {
  const page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Obx((){
            switch (RoutName.values[controller.currentIndex.value]) {
              case RoutName.home:
                return Home();
              case RoutName.declare:
                return declare();
              case RoutName.notice:
                return notice();
              case RoutName.writing:
                return writing();
              case RoutName.user:
                return user();
            }
          }),
        ),
        bottomNavigationBar: Obx(()=> BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //item 이 4개 이상인 경우 추가.
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: '여행등록'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: '여행글'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '마이페이지'),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.lightGreen,
          onTap:controller.changePageIndex,
        ),)
    );
  }
}
