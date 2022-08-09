import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travelidge/app/data/model/home_model.dart';
import 'package:travelidge/app/routes/app_routes.dart';
import 'package:travelidge/app/ui/pages/home/components/sliver_header_data.dart';
import 'package:travelidge/app/ui/pages/home/components/toggle_button_ui.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

final double MinHeight = 60.0, MaxHeight = 280.0;
final controller = HomeController.to;

List<Widget> headerSliverBuilder(
    BuildContext context, bool innerBoxIsScrolled) {
  return <Widget>[
    SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: SliverHeaderDelegateCS(
          minHeight: MinHeight,
          maxHeight: MaxHeight,
          minChild: afterScrolling(),
          maxChild: beforeScrolling(),
        ),
      ),
    ),
  ];
}

/** 스크롤한 후 appBar */
Widget afterScrolling() {
  return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_arrow_down),
              onPressed: () {},
            ),
            SizedBox(width: 3),
            hideFunctionButton('SummaryFun_1'.tr, Palette.lightYellow,
                Palette.strongYellow, 0),
            SizedBox(width: 4),
            hideFunctionButton('SummaryFun_2'.tr, Palette.lightPurple,
                Palette.strongPurple, 1),
            SizedBox(width: 4),
            hideFunctionButton(
                'SummaryFun_3'.tr, Palette.lightBlue, Palette.strongBlue, 2),
            SizedBox(width: 12),
            hideGenreButton(
                'ContentGen_1'.tr, Palette.lightGrey, Palette.black, 0),
            SizedBox(width: 4),
            hideGenreButton(
                'ContentGen_2'.tr, Palette.lightGrey, Palette.black, 1),
            SizedBox(width: 4),
            hideGenreButton(
                'ContentGen_3'.tr, Palette.lightGrey, Palette.black, 2),
            SizedBox(width: 4),
            hideGenreButton(
                'ContentGen_4'.tr, Palette.lightGrey, Palette.black, 3),
            SizedBox(width: 4),
            hideGenreButton(
                'ContentGen_5'.tr, Palette.lightGrey, Palette.black, 4),
            SizedBox(width: 4),
            hideGenreButton(
                'ContentGen_6'.tr, Palette.lightGrey, Palette.black, 5),
            SizedBox(width: 3),
          ],
        ),
      ));
}

/** 스크롤 하기 전 appBar */
Widget beforeScrolling() {
  return SliverHeaderData();
}

/** appbar 작업 Class  */
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
        color: const Color(0xFFFFFFFF),
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

/** body Page */
Widget homeList() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 60.0),
    child: FutureBuilder<HomeListModel>(
      future: controller.getData(),
      builder: (context, snapshot) {
        final data = controller.popular;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); //로딩 애니메이션
        }
        if (snapshot.hasError) {
          return const Center(child: Text('error'));
        }
        if(snapshot.data == null){
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.DETAIL, arguments: index+1),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0)),
                        child: Image.network(
                          'http://www.gapyeongnow.kr/news/photo/201406/5584_5678_3211.jpg',
                          width: 100,
                          height: 130,
                          fit: BoxFit.cover,
                          errorBuilder: (context, url, error) => Container(
                            child: Image.network(
                              'http://www.gapyeongnow.kr/news/photo/201406/5584_5678_3211.jpg',
                              width: 100,
                              height:130,
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 130,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('유럽 배낭여행 6-7월 중에 가실 분'),
                                Text('한라산 입구 6/2 - 8/30'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
              );
            },

            separatorBuilder: (BuildContext context, int index) { return Container(
              height: 1,
              color: Colors.grey,
            ); },


          );
        }
        return Container(
          child: Column(
            children: <Widget>[
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(Routes.DETAIL, arguments: 1),//argument 로 해당 게시물 번호 보내주기
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0)),
                            child: Image.network(
                              '${data[index].thumbnailUrl}',
                              width: 100,
                              height: 130,
                              fit: BoxFit.cover,
                              errorBuilder: (context, url, error) => Container(
                                child: Image.network(
                                    'http://www.gapyeongnow.kr/news/photo/201406/5584_5678_3211.jpg'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 130,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${data[index].preTitle}'),
                                    Text('${data[index].postTitle}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10)
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 1, color: Palette.white),
              )
            ],
          ),
        );
      },
    ),
  );
}

/** 목적지 BottomSheet*/
class LocationBottomSheet extends StatelessWidget {
  LocationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      child: Container(
        height: 800,
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(Icons.search),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'locationBs'.tr),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: HomeController.to.location.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => HomeController.to.locationClick(index),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(HomeController.to.location[index])),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(thickness: 1);
                  },
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: (){},
                  child: roundBoxGesture('CheckOn'.tr, Palette.black,
                      Palette.black, Palette.white, 10)),
            ],
          ),
        ),
      ),
    );
  }
}

/** 일정 Bottom Sheet */
class CalendarBottomSheet extends StatelessWidget {
  const CalendarBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      child: Container(
        height: 800,
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text('calendarBs'.tr),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: TableCalendar(
                      shouldFillViewport: true,
                        lastDay: DateTime(2022, 12, 31),
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2022, 1, 1)),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: roundBoxGesture('CheckOn'.tr, Palette.lightGrey,
                      Palette.lightGrey, Palette.black, 10),
                ),

                const SizedBox(height: 2),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: roundBoxGesture('Cancel'.tr, Palette.white,
                      Palette.lightGrey, Palette.lightGrey, 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
