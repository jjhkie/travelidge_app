

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/controller/community_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class CommMy extends GetView<CommunityController>{
  CommMy({Key? key}) : super(key: key);

  final myTabs = [
    Tab(text: "myBoard".tr),
    Tab(text: "myComment".tr)
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: iconButtonTheme(Icons.arrow_back_ios, Palette.black, 25, ()=> controller.backPage()),
        //leading: Icon(Icons.arrow_back_ios,color: Palette.black),
        title: Text('my'.tr,style:TextStyle(color: Palette.black)),
        centerTitle: true,
        backgroundColor: Palette.white,
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled){
            return [
            SliverToBoxAdapter(
                child: TabBar(
                    controller:controller.myTabController,
                    isScrollable: true,
                    labelColor: Palette.black,
                    tabs:myTabs))
            ];
          }, body: Container(
          child: TabBarView(
            controller: controller.myTabController,
            children: [
              ///나의 게시글
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: ()=> controller.getDetailMove(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('내일부터 3일 휴가인데 뭐할까요?',style:CustomTextStyle.size12GreyFont),
                            Text('그동안 못 본 영화를 봅시다.', style: CustomTextStyle.size16),
                            Text('2022.07.26 10:50', style: CustomTextStyle.size12GreyFont),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 1); }),
              ///나의 댓글
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('여행',style:CustomTextStyle.size12GreyFont),
                          Text('내일부터 3일 휴가인데 뭐할까요? ', style: CustomTextStyle.size16),
                          Row(
                            children: [
                              Text('조회수 12', style: CustomTextStyle.size12GreyFont),
                              Text('댓글 52', style: CustomTextStyle.size12GreyFont),
                              Text('15:53', style: CustomTextStyle.size12GreyFont),
                            ],
                          )
                        ],
                      ),
                    );
                  },separatorBuilder: (BuildContext context, int index) { return Divider(height: 1); })
            ],
          ),
        ),
        ),
      )
    );
  }

}