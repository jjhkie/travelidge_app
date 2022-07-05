import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/** 목적지 페이지*/
Widget destinationPage(int index, double height) {
  return wrapScrollTag(
    index: index,
    child: AnimatedSize(
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
      child: Container(
        height: WriteController.to.scrollType.value ? null : height,
        child: AnimatedPadding(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 1000),
          padding: WriteController.to.scrollType.value
              ? EdgeInsets.only(bottom: 80)
              : EdgeInsets.only(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('destination_t'.tr, style: TextStyle(fontSize: 20)),
              GestureDetector(
                onTap: () => WriteController.to.destinationToggle(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(width: 5),
                      Obx(() => Text(WriteController.to.bottomSheetDe.value,
                          style: TextStyle(fontSize: 16)))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
