
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';
/** 예상 가격 */
Widget pricePage(int index) {
  final controller =WriteController.to;
  return wrapScrollTag(

    index: index,
    child: Obx(() =>Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('price_title'.tr, style: TextStyle(fontSize: 20)),
        SizedBox(height: 12),
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
                    child: Text('price_free'.tr))),
            SizedBox(width:10),
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
                    child: Text('price_pay'.tr))),
          ],
        ),
        SizedBox(height: 28),
        controller.priceChoice.value ? Container() : payPage(controller)
      ],
    ),
    ),
  );
}

payPage(controller) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(top:2,bottom:2,left:15),
        decoration: BoxDecoration(
          border: Border.all(
            color:Colors.black.withOpacity(0.8),
            width:1
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        height: 50,
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    controller.focusUp(hasFocus);
                  }else{
                    controller.focusChange(hasFocus);
                  }
                },
                child: TextFormField(
                  focusNode: controller.priceFocus,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                  controller: controller.priceTextController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                ),
              ),
            ),
            Expanded(
                flex:1,
                child: Text("원"))
          ],
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