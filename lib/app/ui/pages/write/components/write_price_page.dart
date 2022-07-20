
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';
/** 예상 가격 */
Widget pricePage(int index) {
  return wrapScrollTag(
    index: index,
    child: Obx(() =>Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('price_title'.tr, style: TextStyle(fontSize: 20)),
        SizedBox(height: 12),
        Row(
          key: controller.positionKey[index],
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
            SizedBox(width:10),
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
        SizedBox(height: 28),
        WriteController.to.priceChoice.value ? Container() : payPage()
      ],
    ),
    ),
  );
}

payPage() {
  return Column(
    children: [
      SizedBox(
        height: 50,
        child: TextField(
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