import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/model/home_model.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';
import 'package:travelidge/ui/home/widgets/appbar/SliverHeaderData.dart';
import 'package:travelidge/ui/home/widgets/appbar/list_item_header_sliver.dart';
import 'package:travelidge/ui/home/widgets/category_item.dart';
import 'package:travelidge/ui/home/widgets/friend_item.dart';

import 'package:travelidge/ui/home/widgets/popular_item.dart';
import 'package:travelidge/ui/home/widgets/recent_item.dart';

class Home extends GetView<HomeController> {
  final double sliverMinHeight = 80.0, sliverMaxHeight = 260.0;
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: headerSliverBuilder,
        body:CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              _mainList(controller)
            ]))
          ],
        ) 
      ),
    ));
  }

  List<Widget> headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderDelegateCS(
            minHeight: sliverMinHeight,
            maxHeight: sliverMaxHeight,
            minChild: minTopChild(),
            maxChild: topChild(),
          ),
        ),
      ),
    ];
  }

  Widget minTopChild() {
    return ListItemHeaderSliver(controller: controller);
  }

  Widget topChild() {
    return SliverHeaderData();
  }
}

Widget _mainList(controller) {
  return Padding(
    padding: const EdgeInsets.only(top:25.0),
    child: FutureBuilder<HomeListModel>(
      future: controller.getData(),
      builder: (context, snapshot) {
        final popularLocalList = controller.popular;
        final recentTravelList = controller.recent;
        final categoryTravelList = controller.category;
        final friendTravelList = controller.friend;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); //로딩 애니메이션
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
  );
}
class SliverHeaderDelegateCS extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget maxChild, minChild;

  SliverHeaderDelegateCS({
    required this.minHeight,
    required this.maxHeight,
    required this.maxChild,
    required this.minChild,
  });

  late double visibleMainHeight, animationVal, width;

  @override
  bool shouldRebuild(SliverHeaderDelegateCS oldDelegate) => true;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;

    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    width = MediaQuery.of(context).size.width;
    visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    animationVal = scrollAnimationValue(shrinkOffset);

    return Container(
        height: visibleMainHeight,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFFFFFFF),
        child: Stack(
          children: <Widget>[
            getMinTop(),
            animationVal != 0 ? getMaxTop() : Container(),
          ],
        ));
  }

  Widget getMaxTop() {
    return Positioned(
      bottom: 0.0,
      child: Opacity(
        opacity: animationVal,
        child: SizedBox(
          height: maxHeight,
          width: width,
          child: maxChild,
        ),
      ),
    );
  }

  Widget getMinTop() {
    return Opacity(
      opacity: 1 - animationVal,
      child:
          Container(height: visibleMainHeight, width: width, child: minChild),
    );
  }
}

