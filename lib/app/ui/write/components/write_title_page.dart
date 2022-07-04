import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**제목 작성 페이지 */
Widget titlePage() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('title_t'.tr, style: TextStyle(fontSize: 20)),
        TextField(
          decoration: InputDecoration(hintText: 'title_hint_text'.tr),
        ),
      ],
    ),
  );
}
