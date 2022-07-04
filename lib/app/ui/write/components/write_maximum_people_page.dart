
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/**최대 인원 */
Widget maximumPeople() {
  return Container(
    height: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
  );
}
