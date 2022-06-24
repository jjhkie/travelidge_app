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
            switch (RouteName.values[controller.currentIndex.value]) {
              case RouteName.home:
                return Home();
              case RouteName.community:
                return declare();
              case RouteName.writing:
                return notice();
              case RouteName.chat:
                return writing();
              case RouteName.user:
                return user();
            }
          }),
        ),
        bottomNavigationBar: Obx(()=> BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //item 이 4개 이상인 경우 추가.
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '탐색'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: '커뮤니티'),
            BottomNavigationBarItem(icon: _writeButton(Icons.add,'글쓰기',2),label:''),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '내정보'),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: controller.currentIndex.value==2?Colors.black : const Color(0xFFFFC000),
          showSelectedLabels: true,
          onTap:controller.changePageIndex,
        ),)
    );
  }

  /** BottomNavigationbar Middle Button */
  Widget _writeButton(IconData iconData, String text, int index) => Padding(
    padding: const EdgeInsets.only(top:8.0,left:10,right:10),
    child: Container(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFC000)
      ),
      child: InkWell(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData),
            Text(text,style:const TextStyle(fontSize: 12,color: Colors.black))
          ],
        ),
        onTap: () => controller.changePageIndex(index)
      ),
    ),
  );
}
