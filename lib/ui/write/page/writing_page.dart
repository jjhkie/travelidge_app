import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/write/controller/write_controller.dart';

//final c = Get.put(WriteController());

class writing extends GetView<WriteController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                category(), //카테고리
                title(), //제목
                destination(), //목적지
                leadTimeDay(),
                maximumPeople(),
              ],
            ),
          ),
        ),
        bottomSheet: fixedBottom(size));
  }

  /**Bottom 고정 화면 */
  Widget fixedBottom(size) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Color(0xff9E9E9E),
        width: 1.0,
      ))),
      child: Padding(
        padding: EdgeInsets.only(
            top: (size * 0.02), left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text('미리보기', textAlign: TextAlign.center)),
            ),
            SizedBox(width: 4),
            Expanded(
              flex: 3,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey),
                      color: Color(0xffc4c4c4)),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text('등록하기', textAlign: TextAlign.center)),
            ),
          ],
        ),
      ),
    );
  }

  /** 카테고리 선택 페이지*/
  Widget category() {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('category_t'.tr, style: TextStyle(fontSize: 20)),
            Text('category_content'.tr,
                style: TextStyle(fontSize: 14, color: Color(0xff666666))),
            Wrap(
                children: List<Widget>.generate(6, (index) {
              return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Text(
                    'ContentGen_$index'.tr,
                    style: TextStyle(color: Colors.grey),
                  ));
            }).toList())
          ],
        ),
      ),
    );
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
                      value: controller.conference.value,
                      onChanged: (_)=> controller.conferenceToggle()),
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
  Widget maximumPeople(){
    return Container(
      height: 300,
      child: Column(
        children: [
          Text('스케줄당 최대 모집 인원'),
          Row(
            children: [
              IconButton(
                icon:Icon(Icons.remove),
                onPressed: ()=> controller.peopleremove(),
              ),
              Container(
                decoration: BoxDecoration(
                ),
                child: Obx(()=>Text(controller.maxPeople.value.toString())),
              ),
              IconButton(
                icon:Icon(Icons.add),
                onPressed: ()=>controller.peopleAdd(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
