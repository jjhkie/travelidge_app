import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

/**Bottom 고정 화면 */
Widget bottomFixedSheet() {
  return Obx(() => Offstage(
      offstage: WriteController.to.bottomState.value ? false : true,
      child: AnimatedSize(
        duration: Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn,
        child: Container(
          width:WriteController.to.context!.width,
          height: WriteController.to.bottomState.value ? 80 : 0,
          //padding: EdgeInsets.only(bottom:WriteController.to.context.mediaQueryViewInsets.bottom),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Color(0xff9E9E9E),
            width: 1.0
          ))),
          child: Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
              child: WriteController.to.pageFinal.value
                  ? registerButton()
                  : nextButton())
        )
      )));
}

registerButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 1,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 0.5, color: Palette.lightGrey)),
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Text('미리보기', textAlign: TextAlign.center)),
      ),
      SizedBox(width: 4),
      Expanded(
        flex: 3,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 0.5, color: Palette.lightGrey),
                color: Color(0xffc4c4c4)),
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Text('등록하기', textAlign: TextAlign.center)),
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
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.5, color: Palette.lightGrey)),
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Text('다음', textAlign: TextAlign.center)),
        ),
      )
    ],
  );
}
