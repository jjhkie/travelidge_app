import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

/**제목 작성 페이지 */
Widget titlePage(int index) {
  var controller = WriteController.to;
  return wrapScrollTag(
      index: index,
      child: SizedBox(
          child: Obx(() =>
              Padding(
                padding: controller.titleFocusPadding.value
                    ? EdgeInsets.only(
                    bottom: MediaQuery
                        .of(controller.context!)
                        .viewInsets
                        .bottom) : EdgeInsets.zero,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('title_t'.tr, style: TextStyle(fontSize: 20)),
                      Focus(
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            //print('0-----$hasFocus');
                            controller.focusUp(hasFocus);
                          }else{
                            controller.focusChange(hasFocus);
                          }
                        },
                        child: TextField(
                          focusNode: controller.titleFocus,
                          decoration: InputDecoration(
                              hintText: 'title_hint_text'.tr),
                        ),
                      ),
                    ]),
              ))));
}
