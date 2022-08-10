import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/data/model/detail_model.dart';
import 'package:travelidge/app/ui/pages/detail/components/detail_components.dart';
import 'package:travelidge/app/ui/pages/detail/controller/detail_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

class Detail extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.alarm,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0),
        extendBodyBehindAppBar: true,
        /** body */
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100),
          scrollDirection: Axis.vertical,
          child: FutureBuilder<DetailModel>(
            future: controller.getData(Get.arguments),
            builder: (context, snapshot) {
              var board = controller.board;
              return Column(
                children: [
                  /** 상단 image Page*/
                  Container(
                      width: double.infinity,
                      height: 230,
                      child: Stack(
                        children: [
                          PageView.builder(
                              scrollDirection: Axis.horizontal,
                              pageSnapping: true,
                              itemCount: 10,
                              onPageChanged: (value) {
                                print(value);
                              },
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Container(
                                    width: double.infinity,
                                    height: 300,
                                    color: Colors.blue,
                                  );
                                } else {
                                  return Container(
                                    width: double.infinity,
                                    height: 300,
                                    color: Colors.blue,
                                    child: Text('test',
                                        style: TextStyle(color: Colors.white)),
                                  );
                                }
                              }),
                          Positioned(
                              right: 20,
                              bottom: 16,
                              child: SizedBox(
                                  width: 45,
                                  height: 21,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black.withOpacity(0.6)),
                                    child: Center(
                                        child: Text("1/30",
                                            style: TextStyle(
                                                color: Colors.white))),
                                  )))
                        ],
                      )),
                  /**  content Page*/
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  (board.value.type == 0)
                                      ? functionBox(
                                          '현지인 상품',
                                          Palette.lightYellow,
                                          Palette.strongYellow)
                                      : board.value.type == 1
                                          ? functionBox(
                                              '같이 가요',
                                              Palette.lightPurple,
                                              Palette.strongPurple)
                                          : functionBox(
                                              '현지인 요청',
                                              Palette.lightBlue,
                                              Palette.strongBlue),
                                  SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Palette.lightGrey),
                                    child: Text('액티비티',style: TextStyle(color:Colors.grey),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text('${board.value.title}',
                                  style: TextStyle(fontSize: 24)), //제목
                            ),
                            SizedBox(height: 20),
                            contentTextBox(
                                'destination_t'.tr, '${board.value.location}'),
                            contentTextBox('calendar'.tr,
                                '${board.value.startTravelDate}'),
                            contentTextBox(
                                'leadTime'.tr, '${board.value.estimatedTime}'),
                            contentTextBox(
                                'recruit'.tr, '${board.value.personnel}'),
                            contentTextBox(
                                'price_title'.tr, '${board.value.cost}'),
                            SizedBox(height: 50),
                            Container(
                              child: Text('${board.value.contents}'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: Text('조회 ${board.value.hitCount}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.withOpacity(0.7))),
                            ),
                            SizedBox(height: 20),
                            Container(
                                height: 1, color: Colors.grey.withOpacity(0.5)),
                            SizedBox(height: 20),
                            bottomListItem(board.value.type),
                          ],
                        )),
                  )
                ],
              );
            },
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline_sharp,
                      size: 30,
                    )),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.5))),
                    child: Text('enquire'.tr, textAlign: TextAlign.center),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.5))),
                    child:
                        Text('participation'.tr, textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contentTextBox(title, content) {
    print(content);
    return Offstage(
      offstage: content == '0' || content == "" ? true : false,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
                width: 90,
                child: Text('$title',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16))),
            Flexible(
                fit: FlexFit.tight,
                child: title == 'destination_t'.tr
                    ? Text('${controller.board.value.location}',
                        style: TextStyle(color: Colors.grey, fontSize: 16))
                    : (title == 'calendar'.tr && content != "")
                        ? Text(
                            '${controller.stringDate(controller.board.value.startTravelDate)}',
                            style: TextStyle(color: Colors.grey, fontSize: 16))
                        : title == 'leadTime'.tr
                            ? Text('${controller.board.value.estimatedTime}시간',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16))
                            : title == 'recruit'.tr
                                ? Text('${controller.board.value.personnel}명',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16))
                                : Text(
                                    '${controller.stringPrice(controller.board.value.cost)}',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
