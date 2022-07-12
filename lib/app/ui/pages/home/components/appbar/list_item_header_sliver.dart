
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/home/components/appbar/toggle_button_ui.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

class ListItemHeaderSliver extends StatelessWidget {
  const ListItemHeaderSliver({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;
//  final controller = Get.put(SliverScrollController());

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_arrow_down), onPressed: () {  },
            ),
            SizedBox(width:3),
            hideFunctionButton('SummaryFun_1'.tr, Palette.lightYellow,Palette.strongYellow,0),
            SizedBox(width: 4),
            hideFunctionButton('SummaryFun_2'.tr, Palette.lightPurple,Palette.strongPurple,1),
            SizedBox(width: 4),
            hideFunctionButton('SummaryFun_3'.tr, Palette.lightBlue,Palette.strongBlue,2),
            SizedBox(width: 12),
            hideGenreButton('ContentGen_1'.tr, Palette.lightGrey,Palette.black,0),
            SizedBox(width: 4),
            hideGenreButton('ContentGen_2'.tr, Palette.lightGrey,Palette.black,1),
            SizedBox(width: 4),
            hideGenreButton('ContentGen_3'.tr,Palette.lightGrey,Palette.black,2),
            SizedBox(width: 4),
            hideGenreButton('ContentGen_4'.tr, Palette.lightGrey,Palette.black,3),
            SizedBox(width: 4),
            hideGenreButton('ContentGen_5'.tr, Palette.lightGrey,Palette.black,4),
            SizedBox(width: 4),
            hideGenreButton('ContentGen_6'.tr, Palette.lightGrey,Palette.black,5),
            SizedBox(width: 3),
          ],

        ),

      )
    );
  }
}
