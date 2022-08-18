import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/data/model/detail_model.dart';
import 'package:travelidge/app/ui/pages/detail/components/detail_components.dart';
import 'package:travelidge/app/ui/pages/detail/controller/detail_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class Detail extends GetView<DetailController> {
  const Detail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: iconButtonTheme(Icons.arrow_back_ios,Palette.white,24,Get.back),
            actions: [
              iconButtonTheme(Icons.cloud_upload_outlined,Palette.white,24,() { }),
              iconButtonTheme(Icons.alarm,Palette.white,24,() { }),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0),
        extendBodyBehindAppBar: true,
        /** body */
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          scrollDirection: Axis.vertical,
          child: FutureBuilder<DetailModel>(
            future: controller.getData(Get.arguments),
            builder: (context, snapshot) {
              snapshotCheck(snapshot);
              if(snapshot.hasData){
                return wholeMain();
              }else{
                return Container();
              }
            },
          ),
        ),
        /** bottomSheet*/
        bottomSheet: bottomSheetWidget(),
      ),
    );
  }

  /** wholeMain*/
  Widget wholeMain(){
    final board = controller.board;
    return Obx(() => Column(
      children: [
        /** 상단 image PageView */
        SizedBox(
            width: double.infinity,
            height: controller.board.value.type == 2 ? 130 : 230,
            child: Stack(
              children: [
                //TODO api 수정 후 image.network 를 사용하여 이미지 불러오기
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
                          color: Colors.blue
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          height: 300,
                          color: Colors.blue,
                          child: Text('test')
                        );
                      }
                    }),
                //TODO api 수정 후 > 이미지.length 를 통한 Text 출력
                Positioned(
                    right: 20,
                    bottom: 16,
                    child: SizedBox(
                        width: 45,
                        height: 21,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(15),
                              color: Colors.black
                                  .withOpacity(0.6)),
                          child: Center(
                              child: Text("1/30",
                                  style: CustomTextStyle
                                      .size14WhiteFont)),
                        )))
              ],
            )),
        /**  content Page */
        Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          (board.value.type == 0)
                              ? functionBox(
                              'ContentFun_1'.tr,
                              Palette.lightYellow,
                              Palette.strongYellow)
                              : board.value.type == 1
                              ? functionBox(
                              'ContentFun_2'.tr,
                              Palette.lightPurple,
                              Palette.strongPurple)
                              : functionBox(
                              'ContentFun_3'.tr,
                              Palette.lightBlue,
                              Palette.strongBlue),
                          const SizedBox(width: 10),
                          //TODO api 수정 후 > 값 받아서 출력
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                color: Palette.lightGrey),
                            child: Text(
                              '액티비티',
                              style: TextStyle(
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Text('${board.value.title}',
                          style: CustomTextStyle
                              .size24),
                      const SizedBox(height: 20),
                      contentTextBox('destination_t'.tr,
                          '${board.value.location}'),
                      contentTextBox('calendar'.tr,
                          '${board.value.startTravelDate}'),
                      contentTextBox('leadTime'.tr,
                          '${board.value.estimatedTime}'),
                      contentTextBox('recruit'.tr,
                          '${board.value.personnel}'),
                      contentTextBox('price_title'.tr,
                          '${board.value.cost}'),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
                Divider(height: 1, color:Palette.strongGrey.withOpacity(0.5)),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${board.value.contents}',
                    style: CustomTextStyle.size16,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text('Lookup'.tr,
                            style: CustomTextStyle
                                .size14LightGreyFont),
                        const SizedBox(width: 10),
                        Text('${board.value.hitCount}',
                            style: CustomTextStyle
                                .size14LightGreyFont)
                      ],
                    )),
                const SizedBox(height: 20),
                Divider(height: 1, color:Palette.strongGrey.withOpacity(0.5)),
                const SizedBox(height: 20),
                bottomListItem(board.value.type),
              ],
            )),
      ],
    ));
  }

  /** 보여줄 목록 */
  Widget contentTextBox(title, content) {
    return Offstage(
      offstage: content == '0' || content == "" ? true : false,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            SizedBox(
                width: 90,
                child: Text('$title',
                    textAlign: TextAlign.start,
                    style: CustomTextStyle.size16)),
            Flexible(
                fit: FlexFit.tight,
                child: title == 'destination_t'.tr
                    ? Text('${controller.board.value.location}',
                        style: CustomTextStyle.size16GreyFont)
                    : (title == 'calendar'.tr && content != "")
                        ? Text(
                            '${controller.stringDate(controller.board.value.startTravelDate)}',
                            style: CustomTextStyle.size16GreyFont)
                        : title == 'leadTime'.tr
                            ? Text('${controller.board.value.estimatedTime}시간',
                                style: CustomTextStyle.size16GreyFont)
                            : title == 'recruit'.tr
                                ? Text('${controller.board.value.personnel}명',
                                    style: CustomTextStyle.size16GreyFont)
                                : Text(
                                    '${controller.stringPrice(controller.board.value.cost)}',
                                    style: CustomTextStyle.size16GreyFont))
          ],
        ),
      ),
    );
  }

  bottomSheetWidget() {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconButtonTheme(Icons.favorite_outline_sharp,Palette.black,30,(){}),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 40),
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
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 40),
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
    );
  }
}
