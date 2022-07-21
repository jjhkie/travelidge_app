import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';


Widget wrapScrollTag({required int index, required Widget child}) {
  var controller = WriteController.to;
  final double statusBarHeight = MediaQuery.of(controller.context!).padding.top;
  final double safeBottomHeight = MediaQuery.of(controller.context!).padding.bottom;
  var appHeight = AppBar().preferredSize.height;
  var height =
      Get.context!.height - appHeight - statusBarHeight - safeBottomHeight;


  return Offstage(
      offstage: controller.writeComplete[index].value
          ? false
          : controller.scrollTap[index].value
              ? false
              : true,
      child: AnimatedPadding(
          //padding: EdgeInsets.only(top:(height - controller.getSize(index))/2),
          padding: controller.scrollTap[index].value
              ? EdgeInsets.only(
                  top: (height -
                              controller.paddingWidgetValue.value -
                              controller.paddingHalfValue.value) /
                          2 -
                      60-controller.keyboardInsetBottom.value,
                      //-(MediaQuery.of(context).viewInsets.bottom/2)
                  bottom: (height -
                              controller.paddingWidgetValue.value -
                              controller.paddingHalfValue.value) /
                          2 +
                      60+controller.keyboardInsetBottom.value,
                  left: 20,
                  right: 20)
              : index == controller.writeComplete.lastIndexOf(true)
                  ? EdgeInsets.only(top: 30, bottom: 100, left: 20, right: 20)
                  : EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastOutSlowIn,
          child: AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              opacity: controller.writeComplete[index].value
                  ? 1
                  : controller.scrollTap[index].value
                      ? 1
                      : 0,
              child: GestureDetector(
                  onTap: () => controller.widgetClickCounter(index),
                  child: SizedBox(
                      width: Get.context!.width,
                      key: controller.listKey[index],
                      child: AbsorbPointer(
                          absorbing:
                              controller.scrollTap[index].value ? false : true,
                          child: child))))));
}
