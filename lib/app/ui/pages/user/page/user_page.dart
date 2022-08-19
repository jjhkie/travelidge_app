import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/user/controller/user_controller.dart';
import 'package:readmore/readmore.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class User extends GetView<UserController> {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text('myPage'.tr,
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: Center(
                      child: Text('setting'.tr,
                          style: TextStyle(color: Colors.black, fontSize: 14))),
                )
              ],
              bottom: PreferredSize(
                child: Container(
                  color: Colors.grey.withOpacity(0.6),
                  height: 1,
                ),
                preferredSize: Size.fromHeight(1.0),
              )),
        ),
        body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(child: userHeader()),
                  SliverToBoxAdapter(),
                ];
              },
              body: TabBarView(
                controller: controller.tabController,
                children: [
                  Column(
                    children: [
                      ElevatedButton(onPressed: ()=>controller.uploadPageMove(), child: Text('사진 올리기 > ')),
                      Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1/1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ListTile(title: Text('aaaa'));
                            },
                          )),
                    ],
                  ),
                  Container(),
                  Container()
                ],
              )),
        ));
  }

  Widget userHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /** 프로필 사진 및 매너점수 */
          Container(
              padding: EdgeInsets.only(right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.grey),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  )),
                  Text('manner'.tr, style: TextStyle(fontSize: 12))
                ],
              )),

          /** 수정 및 친구관리 Button */
          Container(
              child: Row(
            children: [
              roundElevatedButton('pro_modify', Colors.transparent,
                  Colors.grey.withOpacity(0.6), Colors.black),
              SizedBox(width: 5),
              roundElevatedButton('fri_management', Colors.transparent,
                  Colors.grey.withOpacity(0.6), Colors.black),
            ],
          )),

          /** 유저 설명 및 더보기 */
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: ReadMoreText(
              "어떻게 가이드를 줄 것인지...\n평소 여행 가면 주로 자연과 유적지 보는 것을 선호하고\n관광도 좋아합니다! 즉흥적인 여행을 선호합니다. ㅎㅎㅎ ...\n또 뭐가 있을까... 음 여행 가고 싶다...",
              trimCollapsedText: "all_show".tr,
              trimExpandedText: "",
              trimLines: 3,
              trimMode: TrimMode.Line,
              colorClickableText: Colors.grey.withOpacity(0.8),
              style: TextStyle(fontSize: 14),
            ),
          ),

          /** 탭바 */
          Container(
            child: TabBar(
              controller: controller.tabController,
              tabs: [
                Container(
                  child: Text('photo_album'.tr,
                      style: TextStyle(color: Palette.black)),
                ),
                Container(
                  child: Text('tourList'.tr,
                      style: TextStyle(color: Palette.black)),
                ),
                Container(
                  child: Text('wishList'.tr,
                      style: TextStyle(color: Palette.black)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
