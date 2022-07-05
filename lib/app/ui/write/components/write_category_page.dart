import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/** 카테고리 선택 페이지*/

Widget writeCategoryPage(int index, double height) {
  return wrapScrollTag(
    index: index,
    child: AnimatedSize(
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
      child: Obx(() => Container(
            height: WriteController.to.scrollType.value ? null : height,
            child: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 1000),
              padding: WriteController.to.scrollType.value
                  ? EdgeInsets.only(bottom: 80,top: 30)
                  : EdgeInsets.only(bottom: 20,top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
          )),
    ),
  );
}
