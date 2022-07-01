import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/write/components/bottom_fixed_sheet.dart';
import 'package:travelidge/ui/write/components/category_page.dart';
import 'package:travelidge/ui/write/controller/write_controller.dart';

class Writing extends GetView<WriteController> {
  const Writing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                categoryPage(), //카테고리
                title(), //제목
                destination(), //목적지
                leadTimeDay(),
                maximumPeople(),
                price(),
                content(),
              ],
            ),
          ),
        ),
        bottomSheet: bottomFixedSheet());
  }


  /**제목 작성 페이지 */
  Widget title() {
    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('title_t'.tr, style: TextStyle(fontSize: 20)),
          TextField(),
        ],
      ),
    );
  }

  /** 목적지 페이지*/
  Widget destination() {
    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('destination_t'.tr, style: TextStyle(fontSize: 20)),
          GestureDetector(
            onTap: () => controller.destinationToggle(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 5),
                  Obx(() => Text(controller.bottomSheetDe.value,
                      style: TextStyle(fontSize: 16)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /** 소요 시간 기간*/
  Widget leadTimeDay() {
    return Container(
      height: 300,
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('lead_t'.tr, style: TextStyle(fontSize: 20)),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => controller.leadTimeToggle('time'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.leadTimeDay.value
                                  ? Colors.grey
                                  : Colors.white,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('lead_time'.tr))),
                  GestureDetector(
                      onTap: () => controller.leadTimeToggle('day'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.leadTimeDay.value
                                  ? Colors.white
                                  : Colors.grey,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('lead_day'.tr))),
                ],
              ),
              controller.leadTimeDay.value ? leadTime() : leadDay(),
              Row(
                children: [
                  Checkbox(
                      value: controller.timeDayConference.value,
                      onChanged: (_) => controller.timeDayConferenceToggle()),
                  Text('협의 가능')
                ],
              )
            ],
          )),
    );
  }

  /** leadTimeDay TextField */
  leadTimeDayField() {
    return SizedBox(
      width: 50,
      child: TextField(
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.5),
            hintText: '0',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.5))),
        maxLines: 1,
      ),
    );
  }

  /** leadTime*/
  leadTime() {
    return Row(
      children: [leadTimeDayField(), Text('시간')],
    );
  }

  /**leadDay*/
  leadDay() {
    return Row(
      children: [leadTimeDayField(), Text('박'), leadTimeDayField(), Text('일')],
    );
  }

  /**최대 인원 */
  Widget maximumPeople() {
    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('스케줄당 최대 모집 인원', style: TextStyle(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => controller.peopleremove(),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 19),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffD9D9D9)),
                child: Obx(() => Text(
                      controller.maxPeople.value.toString(),
                      style: TextStyle(fontSize: 24),
                    )),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => controller.peopleAdd(),
              ),
            ],
          )
        ],
      ),
    );
  }

  /** 예상 가격 */
  Widget price() {
    return Container(
      height: 300,
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('예상비용', style: TextStyle(fontSize: 20)),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => controller.priceToggle('free'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.priceChoice.value
                                  ? Colors.grey
                                  : Colors.white,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('무료'))),
                  GestureDetector(
                      onTap: () => controller.priceToggle('pay'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.priceChoice.value
                                  ? Colors.white
                                  : Colors.grey,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('유료'))),
                ],
              ),
              controller.priceChoice.value ? Container() : payPage()
            ],
          )),
    );
  }

  payPage() {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular((15)),
              ),
              suffixText: '원',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(15))),
        ),
        Row(
          children: [
            Checkbox(
                value: controller.priceConference.value,
                onChanged: (_) => controller.priceConferenceToggle()),
            Text('협의 가능')
          ],
        )
      ],
    );
  }

  Widget content() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('여행 내용',style:TextStyle(fontSize: 20)),
          Text('방문장소와 체험내용 등 최대한 구체적으로 계획을 알려주세요',style:TextStyle(color: Colors.grey)),
          TextField(
            decoration: InputDecoration(
              hintText: '방문장소와 체험내용 등 최대한 구체적으로 계획을 알려주세요',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5))),
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
