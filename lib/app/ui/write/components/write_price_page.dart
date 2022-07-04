
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/** 예상 가격 */
Widget pricePage() {
  return Container(
    height: 300,
    child: Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              value: WriteController.to.priceConference.value,
              onChanged: (_) => WriteController.to.priceConferenceToggle()),
          Text('Conference_check'.tr)
        ],
      )
    ],
  );
}