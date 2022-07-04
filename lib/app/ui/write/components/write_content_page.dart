

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget contentPage() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
  );
}