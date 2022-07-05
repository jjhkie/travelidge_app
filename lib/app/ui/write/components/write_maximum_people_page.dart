
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/components/wrap_Scroll_Tag.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/**최대 인원 */
Widget maximumPeople(int index, double height) {
  return wrapScrollTag(
    index: index,
    child: AnimatedSize(
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
      child: SizedBox(
        height: WriteController.to.scrollType.value?null:height,
        child: AnimatedPadding(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 1000),
          padding:  WriteController.to.scrollType.value
              ? EdgeInsets.only(bottom: 80)
              : EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('maximum_people_title'.tr, style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => WriteController.to.peopleremove(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 19),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffD9D9D9)),
                    child: Obx(() => Text(
                      WriteController.to.maxPeople.value.toString(),
                      style: TextStyle(fontSize: 24),
                    )),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => WriteController.to.peopleAdd(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
