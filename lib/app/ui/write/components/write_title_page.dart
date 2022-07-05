import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/**제목 작성 페이지 */
Widget titlePage(int index, double height) {
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
              Text('title_t'.tr, style: TextStyle(fontSize: 20)),
              TextField(
                decoration: InputDecoration(hintText: 'title_hint_text'.tr),
              ),
              Padding(padding: EdgeInsets.only(bottom:MediaQuery.of(WriteController.to.context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    ),
  );
}
