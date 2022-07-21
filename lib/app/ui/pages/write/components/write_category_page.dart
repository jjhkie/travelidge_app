import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

/** 카테고리 선택 페이지*/
Widget writeCategoryPage(int index) {
  var controller = WriteController.to;
  return wrapScrollTag(
      index: index,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('category_t'.tr, style: TextStyle(fontSize: 20)),
        SizedBox(height: 2),
        Text('category_content'.tr,
            style: TextStyle(fontSize: 14, color: Color(0xff666666))),
        SizedBox(height: 20),
        Wrap(
            children: List<Widget>.generate(6, (index) {
          return GestureDetector(
              onTap: () => controller.categoryButtonEvent(index),
              child: Obx(() => Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          width: 0.5,
                          color: controller.categoryButton[index].value
                              ? Colors.black
                              : Colors.grey)),
                  child: Text(
                    'ContentGen_$index'.tr,
                    style: TextStyle(
                        color: controller.categoryButton[index].value
                            ? Colors.black
                            : Colors.grey),
                  ))));
        }).toList())
      ]));
}
