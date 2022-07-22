import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';

Widget calendarPage(int index) {
  return wrapScrollTag(
      index: index,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("calendar_title".tr),
        SizedBox(height: 12),
        SizedBox(
            height: 200,
            width: 200,
            child: Placeholder(
              color: Colors.black,
            ))
      ]));
}
