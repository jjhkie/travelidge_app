import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/page/community_page.dart';
import 'package:travelidge/app/ui/pages/home/page/home_page.dart';
import 'package:travelidge/app/ui/pages/nav/components/nav_components.dart';
import 'package:travelidge/app/ui/pages/nav/controller/nav_controller.dart';
import 'package:travelidge/app/ui/pages/user/page/user_page.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

class Page extends GetView<NavController> {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Obx(() {
            switch (RouteName.values[controller.currentIndex.value]) {
              case RouteName.home:
                return const Home();
              case RouteName.community:
                return Community();
              case RouteName.write:
                return Container();
              case RouteName.chat:
                return Container();
              case RouteName.user:
                return const User();
            }
          }),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/homeIcon.png',
                      color: Colors.grey),
                  activeIcon: Image.asset('assets/icons/homeIcon.png',
                      color: Palette.mainColor),
                  label: 'home'.tr),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/commIcon.png',
                      color: Colors.grey),
                  activeIcon: Image.asset('assets/icons/commIcon.png',
                      color: Palette.mainColor),
                  label: 'community'.tr),
              BottomNavigationBarItem(
                  icon: writeButton('assets/icons/addIcon.png', 'writing'.tr, 2), label: ''),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.chat), label: 'chat'.tr),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.people), label: 'myPage'.tr),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: controller.currentIndex.value == 2
                ? Palette.black
                : Palette.mainColor,
            showSelectedLabels: true,
            onTap: controller.changePageIndex,
          ),
        ));
  }
}
