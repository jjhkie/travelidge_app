import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';

/** 카테고리 선택 페이지*/
Widget writeCategoryPage(int index) {
  return wrapScrollTag(
    index: index,
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
  );
}
