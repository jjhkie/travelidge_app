import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

final double statusBarHeight = MediaQuery.of(context!).padding.top;
var appHeight = AppBar().preferredSize.height;
var context = Get.context;
var height = Get.context!.height - appHeight - statusBarHeight - 60;
var controller = WriteController.to;

Widget wrapScrollTag({required int index, required Widget child}) => Offstage(
    offstage: controller.writeComplete[index].value
        ? false
        : controller.scrollTap[index].value
            ? false
            : true,
    child: AnimatedSize(
      duration: Duration(milliseconds: 800),

      curve: Curves.fastOutSlowIn,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 1200),
        curve: Curves.easeInOutBack,
        opacity: controller.writeComplete[index].value?1:controller.scrollTap[index].value ? 1 : 0,
        child: Padding(
          padding: controller.scrollTap[index].value
              ? EdgeInsets.symmetric(horizontal: 20, vertical: 0)
              : EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
              key: controller.listKey[index],
              height: controller.scrollTap[index].value
                  ? index == 0
                      ? height
                      : height - 80
                  : null,
              child: child),
        ),
      ),
    ));
