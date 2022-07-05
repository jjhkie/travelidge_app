
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/** 예상 가격 */
Widget pricePage(int index, double height) {
  return wrapScrollTag(
    index: index,
    child: AnimatedSize(
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
      child: SizedBox(
        height: WriteController.to.scrollType.value?null:height,
        child:  AnimatedPadding(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 1000),
            padding:  WriteController.to.scrollType.value
                ? EdgeInsets.only(bottom: 80)
                : EdgeInsets.only(bottom: 20),
          child: Obx(() =>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('price_title'.tr, style: TextStyle(fontSize: 20)),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => WriteController.to.priceToggle('free'),
                      child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: WriteController.to.priceChoice.value
                                  ? Colors.grey
                                  : Colors.white,
                              border:
                              Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('price_free'.tr))),
                  GestureDetector(
                      onTap: () => WriteController.to.priceToggle('pay'),
                      child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: WriteController.to.priceChoice.value
                                  ? Colors.white
                                  : Colors.grey,
                              border:
                              Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('price_pay'.tr))),
                ],
              ),
              WriteController.to.priceChoice.value ? Container() : payPage()
            ],
          ),
        )),
      ),
    ),
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
              value: WriteController.to.priceConference.value,
              onChanged: (_) => WriteController.to.priceConferenceToggle()),
          Text('Conference_check'.tr)
        ],
      )
    ],
  );
}