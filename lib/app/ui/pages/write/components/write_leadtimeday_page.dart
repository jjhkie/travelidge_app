import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

/** 소요 시간 기간*/

Widget leadTimeDayPage(int index) {
  final controller = WriteController.to;
  return wrapScrollTag(
      index: index,
      child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('lead_t'.tr, style: TextStyle(fontSize: 20)),
                SizedBox(height: 11),
                Row(children: [
                  GestureDetector(
                      onTap: () => controller.leadTimeToggle('time'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.leadTimeDay.value
                                  ? Colors.grey
                                  : Colors.white,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('lead_time'.tr))),
                  SizedBox(width: 12),
                  GestureDetector(
                      onTap: () => controller.leadTimeToggle('day'),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.leadTimeDay.value
                                  ? Colors.white
                                  : Colors.grey,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('lead_day'.tr))),
                ]),
                SizedBox(height: 23),
                WriteController.to.leadTimeDay.value ? leadTime(controller) : leadDay(controller),
                Row(children: [
                  Checkbox(
                      value: controller.timeDayConference.value,
                      onChanged: (_) =>
                          controller.timeDayConferenceToggle()),
                  Text('협의 가능')
                ])
              ])));
}

/** leadTime*/
leadTime(controller) {
  return Row(
    children: [leadTimeDayField(controller,controller.timeTextController,controller.timeFocus), SizedBox(width: 12), Text('시간')],
  );
}

/**leadDay*/
leadDay(controller) {
  return Row(
    children: [
      leadTimeDayField(controller,controller.nightTextController,controller.nightFocus),
      SizedBox(width: 12),
      Text('박'),
      SizedBox(width: 12),
      leadTimeDayField(controller,controller.dayTextController,controller.dayFocus),
      Text('일')
    ],
  );
}

/** leadTimeDay TextField */
leadTimeDayField(controller,textController,focus) {
  final controller = WriteController.to;
  return SizedBox(
      width: 50,
      height: 50,
      child: Focus(
        onFocusChange: (hasFocus){
          if (hasFocus) {
            controller.focusUp(hasFocus);
          }else{
            controller.focusChange(hasFocus);
          }
        },
        child: TextField(
          onChanged: (text){
            if(text.isEmpty){
             // controller.effectiveCheck.value = false;
            }
          },
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          controller: textController,
          focusNode: focus,
          maxLength: 2,
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            counterText: "",
              filled: true,
              fillColor: Colors.grey.withOpacity(0.5),
              hintText: '0',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5))),
          maxLines: 1,
          keyboardType: TextInputType.number,
        ),
      ));
}
