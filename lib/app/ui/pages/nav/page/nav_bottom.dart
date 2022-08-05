import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/home/page/home_page.dart';
import 'package:travelidge/app/ui/pages/nav/controller/nav_controller.dart';
import 'package:travelidge/app/ui/pages/notice/screen/notice_page.dart';
import 'package:travelidge/app/ui/pages/user/page/user_page.dart';
import 'package:travelidge/app/ui/pages/write/page/writing_page.dart';

class Page extends GetView<NavController> {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Obx(() {
            switch (RouteName.values[controller.currentIndex.value]) {
              case RouteName.home:
                return Home();
              case RouteName.community:
                return Container();
              case RouteName.writing:
                return notice();
              case RouteName.chat:
                return Writing();
              case RouteName.user:
                return User();
            }
          }),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '탐색'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none), label: '커뮤니티'),
              BottomNavigationBarItem(
                  icon: _writeButton(Icons.add, '글쓰기', 2), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: '내정보'),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: controller.currentIndex.value == 2
                ? Colors.black
                : const Color(0xFFFFC000),
            showSelectedLabels: true,
            onTap: controller.changePageIndex,
          ),
        ));
  }

  /** BottomNavigationbar Middle Button */
  Widget _writeButton(IconData iconData, String text, int index) => Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
        child: Container(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFFC000)),
          child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(iconData),
                  Text(text,
                      style: const TextStyle(fontSize: 12, color: Colors.black))
                ],
              ),
              onTap: () => controller.changePageIndex(index)),
        ),
      );
}
