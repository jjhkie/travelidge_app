

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

Widget contentPage(int index, double height) {
  return wrapScrollTag(
    index: index,
    child: AnimatedSize(
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
      child: SizedBox(
        height: WriteController.to.scrollType.value?null:height,
        child: AnimatedPadding(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 1000),
          padding:  WriteController.to.scrollType.value
              ? EdgeInsets.only(bottom: 80)
              : EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('content_title'.tr,style:TextStyle(fontSize: 20)),
              Text('content_subtitle'.tr,style:TextStyle(color: Colors.grey)),
              TextField(
                decoration: InputDecoration(
                    hintText: 'content_hint_text'.tr,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5))),
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}