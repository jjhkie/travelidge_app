import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';
final controller = WriteController.to;
/**Bottom 고정 화면 */
Widget bottomFixedSheet() {

  return Obx(() => Offstage(
      offstage: controller.bottomState.value ? false : true,
      child: AnimatedSize(
          duration: Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn,
          child: Container(
              width: controller.context!.width,
              height: controller.bottomState.value ? 80 : 0,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color(0xff9E9E9E), width: 1.0))),
              child: Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
                  child: controller.pageFinal.value
                      ? registerButton()
                      : nextButton())))));
}

registerButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {},
            child: roundBoxGesture(
                'Preview'.tr, Colors.transparent, Palette.lightGrey, Palette.black,7),
          )),
      SizedBox(width: 4),
      Expanded(
        flex: 3,
        child: GestureDetector(
            onTap: () {},
            child: roundBoxGesture(
                'register'.tr, Palette.lightGrey, Palette.lightGrey, Palette.black,7)),
      ),
    ],
  );
}

nextButton() {
  return Row(
    children: [
      Expanded(
          child: GestureDetector(
              onTap: () => WriteController.to.effectiveFunc('next'),
              child: roundBoxGesture(
                'next'.tr,
                Colors.transparent,
                Palette.lightGrey,
                Palette.black,7
              )))
    ],
  );
}
