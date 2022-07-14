import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

/** 목적지 페이지*/
Widget destinationPage(int index) {
  return wrapScrollTag(
      index: index,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('destination_t'.tr, style: TextStyle(fontSize: 20)),
            GestureDetector(
                onTap: () => WriteController.to.destinationToggle(),
                child: Container(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                       Icon(Icons.location_on_outlined),
                       SizedBox(width: 5),
                      Obx(() => Text(WriteController.to.bottomSheetDe.value,
                          style: TextStyle(fontSize: 16)))
                    ])))
          ]));
}
