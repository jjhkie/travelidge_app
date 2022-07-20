import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';

/**제목 작성 페이지 */
Widget titlePage(int index) {
  return wrapScrollTag(
      index: index,
      child: SizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text('title_t'.tr, style: TextStyle(fontSize: 20)),
            TextField(
              decoration: InputDecoration(hintText: 'title_hint_text'.tr),
            ),
                // Padding(
                //     padding: EdgeInsets.only(
                //         bottom: MediaQuery.of(WriteController.to.context)
                //             .viewInsets
                //             .bottom))
          ])));
}
