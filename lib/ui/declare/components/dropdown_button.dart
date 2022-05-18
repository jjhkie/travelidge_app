import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/controller/declare_controller.dart';

class DropDownButtonWidget extends GetView<DeclareController> {
  const DropDownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
          value: controller.index.value,
          items: const [
            DropdownMenuItem(child: Text('가이드 여행'), value: 0),
            DropdownMenuItem(child: Text('가이드 요청'), value: 1),
            DropdownMenuItem(child: Text('같이가자'), value: 2)
          ],
          onChanged: (int? value) {
            controller.changeDropDown(value!);
          },
        ));
  }
}
