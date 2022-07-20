import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

/** 소요 시간 기간*/
Widget leadTimeDayPage(int index) {
  return wrapScrollTag(
      index: index,
      child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('lead_t'.tr, style: TextStyle(fontSize: 20)),
                SizedBox(height: 11),
                Row(children: [
                  GestureDetector(
                      onTap: () => WriteController.to.leadTimeToggle('time'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: WriteController.to.leadTimeDay.value
                                  ? Colors.grey
                                  : Colors.white,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('lead_time'.tr))),
                  SizedBox(width: 12),
                  GestureDetector(
                      onTap: () => WriteController.to.leadTimeToggle('day'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: WriteController.to.leadTimeDay.value
                                  ? Colors.white
                                  : Colors.grey,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('lead_day'.tr))),
                ]),
                SizedBox(height: 23),
                WriteController.to.leadTimeDay.value ? leadTime() : leadDay(),
                Row(children: [
                  Checkbox(
                      value: WriteController.to.timeDayConference.value,
                      onChanged: (_) =>
                          WriteController.to.timeDayConferenceToggle()),
                  Text('협의 가능')
                ])
              ])));
}

/** leadTime*/
leadTime() {
  return Row(
    children: [leadTimeDayField(), SizedBox(width: 12), Text('시간')],
  );
}

/**leadDay*/
leadDay() {
  return Row(
    children: [
      leadTimeDayField(),
      SizedBox(width: 12),
      Text('박'),
      SizedBox(width: 12),
      leadTimeDayField(),
      Text('일')
    ],
  );
}

/** leadTimeDay TextField */
leadTimeDayField() {
  return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.5),
            hintText: '0',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.5))),
        maxLines: 1,
        keyboardType: TextInputType.number,
      ));
}
