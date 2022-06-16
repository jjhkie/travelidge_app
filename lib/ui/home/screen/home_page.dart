import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/model/home_model.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';
import 'package:travelidge/ui/home/widgets/appbar_header.dart';
import 'package:travelidge/ui/home/widgets/category_item.dart';
import 'package:travelidge/ui/home/widgets/friend_item.dart';
import 'package:travelidge/ui/home/widgets/popular_item.dart';
import 'package:travelidge/ui/home/widgets/recent_item.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          /** Appbar  */
          _mainAppbar(),
          /** Appbar 하단 부분  */
          SliverPersistentHeader(
              pinned: true, delegate: AppBarHeader(controller: controller)),
          /** Main List   */
          _mainList(controller),
        ],
      ),
    );
  }
}

Widget _mainAppbar() {
  return const SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Text('logo',
          style: TextStyle(color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center),
      actions: [
        Icon(Icons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(Icons.notifications_none, color: Colors.black),
        SizedBox(width: 20)
      ],
      stretch: true,
      pinned: false,
      centerTitle: false);
}

Widget _mainList(controller) {
  return SliverList(
      delegate: SliverChildListDelegate([
        FutureBuilder<HomeListModel>(
          future: controller.getData(),
          builder: (context, snapshot) {
            final popularLocalList = controller.popular;
            final recentTravelList = controller.recent;
            final categoryTravelList = controller.category;
            final friendTravelList = controller.friend;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator()); //로딩 애니메이션
            }
            if (snapshot.hasError) {
              return const Center(child: Text('error'));
            }
            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    popularList(popularLocalList),
                    const SizedBox(height: 30),
                    recentList(recentTravelList),
                    const SizedBox(height: 30),
                    categoryList(categoryTravelList),
                    const SizedBox(height: 30),
                    friendList(friendTravelList)
                  ],
                ));
          },
        ),
      ]));
}