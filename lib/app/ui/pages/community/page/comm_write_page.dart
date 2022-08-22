import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/controller/community_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class CommWrite extends GetView<CommunityController> {
  const CommWrite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: iconButtonTheme(Icons.arrow_back_ios, Palette.black, 25,
              () => controller.backPage()),
          backgroundColor: Palette.white,
          elevation: 0.0,
          bottom: PreferredSize(
            child: Container(
              color: Palette.lightGrey,
              height: 1,
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
          actions: [
            GestureDetector(
              onTap: () => controller.backPage(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('regis'.tr, style: CustomTextStyle.size16BlackFont),
              ),
            )
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text('${controller.selectedValue}')),
                  //iconButtonTheme(Icons.arrow_drop_down, Palette.black, 15, () {})
                  DropdownButton(
                      underline: const SizedBox.shrink(),
                      //value: controller.selectedValue,
                      items: controller.categoryList.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedValue.value = value.toString();
                      })
                ],
              ),
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Palette.lightGrey),
                      top: BorderSide(color: Palette.lightGrey))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "title_register_text".tr),
                  maxLines: 2,
                ),
              ),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "content_register_text".tr),
                  maxLines: 10,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 80,
              child: iconButtonTheme(
                  Icons.camera_alt_outlined, Palette.black, 25, ()=>controller.getImage()),
            )
          ],
        )),
      ),
    );
  }
}
