

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';

Widget contentPage(int index) {
  return wrapScrollTag(
    index: index,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('content_title'.tr,style:TextStyle(fontSize: 20)),
        SizedBox(height: 8),
        Text('content_subtitle'.tr,style:TextStyle(color: Colors.grey)),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
              hintText: 'content_hint_text'.tr,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5))),
          maxLines: 10,
        ),
      ],
    ),
  );
}