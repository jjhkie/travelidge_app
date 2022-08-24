import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/controller/community_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class Community extends GetView<CommunityController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: EmptyAppBar(),
        body: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverPersistentHeader(pinned: true, delegate: TabBarItem()),
              SliverFillRemaining(
                hasScrollBody: true,
                child: tabBarViewItem(),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///tabBarViewList
  Widget tabBarViewItem() {
    return TabBarView(
      controller: controller.tabController,
      children: [
        Container(
          color: Palette.white,
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller.getDetailMove(),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('여행', style: CustomTextStyle.size12GreyFont),
                        const Text('내일부터 3일 휴가다 예에ㅔㅔㅔㅔ에에ㅔㅔㅔ'),
                        Row(
                          children: [
                            const Text('조회수 12',
                                style: CustomTextStyle.size12GreyFont),
                            const SizedBox(width: 5),
                            const Text('댓글 12',
                                style: CustomTextStyle.size12GreyFont),
                            const SizedBox(width: 5),
                            const Text('16:42',
                                style: CustomTextStyle.size12GreyFont),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 1);
              }),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const Text('aaaaa');
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const Text('aaaaa');
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const Text('aaaaa');
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const Text('aaaaa');
          },
        ),
      ],
    );
  }
}

class TabBarItem extends SliverPersistentHeaderDelegate {
  final commTabs = [
    Tab(text: "total".tr),
    Tab(text: "travel".tr),
    Tab(text: "love".tr),
    Tab(text: "postscript".tr),
    Tab(text: "free".tr),
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
                hintText: "search_hint_text".tr,
                border: InputBorder.none,
                prefixIcon:Image.asset('assets/icons/searchGrey.png')),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
              controller: CommunityController.to.tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              unselectedLabelStyle: CustomTextStyle.size16BlackFont,
              labelStyle: CustomTextStyle.size16BlackBoldFont,
              labelColor: Palette.black,
              tabs: commTabs),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Palette.white,
            border: Border(bottom: BorderSide(color: Palette.lightGrey)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('popularOrder'.tr),
                    SizedBox(width: 15),
                    Text('recentOrder'.tr)
                  ],
                ),
                Row(
                  children: [
                    rowIconButton('assets/icons/writeIcon.png', 'writing'.tr, ()=> CommunityController.to.writePageMove()),
                    const SizedBox(width: 15),
                    rowIconButton('assets/icons/my.png', 'my'.tr, ()=> CommunityController.to.myPageMove())
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
  double get maxExtent => 169;

  @override
  double get minExtent => 169;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
