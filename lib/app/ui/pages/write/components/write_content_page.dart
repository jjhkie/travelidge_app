

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

Widget contentPage(int index) {
  final controller = WriteController.to;
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
        Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              controller.focusUp(hasFocus);
            }else{
              controller.focusChange(hasFocus);
            }
          },
          child: TextFormField(
            focusNode: controller.contentFocus,
            controller: controller.contentTextController,
            decoration: InputDecoration(
                hintText: 'content_hint_text'.tr,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5))),
            maxLines: 10,
          ),
        ),
      ],
    ),
  );
}