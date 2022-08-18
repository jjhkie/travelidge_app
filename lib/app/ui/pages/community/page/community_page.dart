import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/controller/community_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class Community extends GetView<CommunityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.lightGrey,
      appBar: EmptyAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverPersistentHeader(pinned: true, delegate: TabBarItem()),
            SliverFillRemaining(
              hasScrollBody: true,
              child: tabBarViewItem(),
            )
          ],
        ),
      ),
    );
  }

  searchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (text) {},
        decoration: InputDecoration(
            filled: true,
            fillColor: Palette.strongGrey,
            hintText: "찾고 싶은 키워드를 검색해 보세요.",
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Palette.lightGrey,
            )),
      ),
    );
  }

  Widget tabBarViewItem() {
    return TabBarView(
      controller: controller.tabController,
      children: [
        Container(
          color: Palette.white,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text('aaaaa');
            },
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text('aaaaa');
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text('aaaaa');
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text('aaaaa');
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text('aaaaa');
          },
        ),
      ],
    );
  }

  Widget tabMenuBar() {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        border: Border(bottom: BorderSide(color: Palette.lightGrey)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [Text('인기순'), SizedBox(width: 15), Text('최신순')],
            ),
            Row(
              children: [Text('글쓰기'), SizedBox(width: 15), Text('MY')],
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarItem extends SliverPersistentHeaderDelegate {
  final commTabs = [
    Tab(text: "전체"),
    Tab(text: "여행"),
    Tab(text: "연애&썸"),
    Tab(text: "후기"),
    Tab(text: "자유"),
  ];

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 12.0),
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (text) {},
            decoration: InputDecoration(
                filled: true,
                fillColor: Palette.strongGrey,
                hintText: "찾고 싶은 키워드를 검색해 보세요.",
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Palette.lightGrey,
                )),
          ),
        ),
        TabBar(
            controller: CommunityController.to.tabController,
            isScrollable: true,
            labelColor: Palette.black,
            tabs: commTabs),
        Container(
          decoration: BoxDecoration(
            color: Palette.white,
            border: Border(bottom: BorderSide(color: Palette.lightGrey)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [Text('인기순'), SizedBox(width: 15), Text('최신순')],
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => CommunityController.to.writePageMove(),
                        child: Text('글쓰기')),
                    SizedBox(width: 15),
                    GestureDetector(
                        onTap: () => CommunityController.to.myPageMove(),
                        child: Text('MY'))
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 169;

  @override
  // TODO: implement minExtent
  double get minExtent => 169;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
