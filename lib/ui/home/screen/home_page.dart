import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/provider/api.dart';
import 'package:travelidge/data/repository/home_repository.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';
import 'package:travelidge/data/model/home_model.dart';
import 'package:travelidge/ui/home/widgets/SliverHeaderData.dart';
import 'package:travelidge/ui/home/widgets/category_item.dart';
import 'package:travelidge/ui/home/widgets/friend_item.dart';
import 'package:travelidge/ui/home/widgets/list_item_header_sliver.dart';
import 'package:travelidge/ui/home/widgets/popular_item.dart';
import 'package:travelidge/ui/home/widgets/recent_item.dart';

class home extends GetView<HomeController> {

  final controller = Get.put(HomeController(HomeRepository(ApiClient())));

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(

      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            elevation: 1.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,

            leading: const Text('logo',style: TextStyle(color: Colors.black,fontSize:20),),
            actions: [
              Icon(Icons.add_circle,color: Colors.black),
              SizedBox(width: 20),
              Icon(Icons.add_alert,color: Colors.black)
            ],
            stretch: true,
            pinned:  false,

            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                stretchModes: const [StretchMode.zoomBackground],
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    //const BackgroundSliver(),
                    Positioned(
                      right: 10,
                      top: (sizeHeight + 20) - controller.valueScroll.value,
                      child: const Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: (sizeHeight + 20) - controller.valueScroll.value,
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderSliver(controller: controller)),

          SliverList(
              delegate: SliverChildListDelegate([
                FutureBuilder<HomeListModel>(
                  future: controller.getData(),
                  builder: (context, snapshot) {
                    var data = snapshot.data?.home;

                    final popularLocalList = controller.popular;
                    final recentTravelList = controller.recent;
                    final categoryTravelList = controller.category;
                    final friendTravelList = controller.friend;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator()); //로딩 애니메이션
                    }
                    //에러가 발생한 경우 반환되는 부분
                    if (snapshot.hasError) {
                      return Center(child: Text('error'));
                    }
                    return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            popularList(popularLocalList),
                            SizedBox(height: 30),
                            recentList(recentTravelList),
                            SizedBox(height: 30),
                            categoryList(categoryTravelList),
                            SizedBox(height: 30),
                            friendList(friendTravelList)
                          ],
                        ));
                  },
                ),
              ]))
        ],
      ),
    );
  }
}


const _maxHeaderExtent = 240.0;
const _minHeaderExtent = 100.0;

class _HeaderSliver extends SliverPersistentHeaderDelegate {
  _HeaderSliver({required this.controller});

  final HomeController controller;


  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    final percent = (shrinkOffset-70) / _maxHeaderExtent;
    // controller.visibleHeader.value = true;

    return Stack(
      
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0- controller.globalOffsetValue.value,
          child: Container(
            color: Colors.white,
            height: _maxHeaderExtent,
            child: Column(
              children: [
                const SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: percent > 0.0
                          ? ListItemHeaderSliver(controller: controller)
                          : const SliverHeaderData()),
                )
              ],
            ),
          ),
        ),
        if (percent > 0.1)
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: percent > 0.1
                      ? Container(
                    height: 0.5,
                    color: Colors.blue,
                  )
                      : null))
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}