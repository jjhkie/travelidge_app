import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/write/components/bottom_fixed_sheet.dart';
import 'package:travelidge/app/ui/pages/write/components/write_calendar_page.dart';
import 'package:travelidge/app/ui/pages/write/components/write_category_page.dart';
import 'package:travelidge/app/ui/pages/write/components/write_content_page.dart';
import 'package:travelidge/app/ui/pages/write/components/write_destination_page.dart';
import 'package:travelidge/app/ui/pages/write/components/write_leadtimeday_page.dart';
import 'package:travelidge/app/ui/pages/write/components/write_maximum_people_page.dart';
import 'package:travelidge/app/ui/pages/write/components/write_price_page.dart';
import 'package:travelidge/app/ui/pages/write/components/write_title_page.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

class Writing extends GetView<WriteController> {
  Writing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
              controller: controller.autoController,
              physics: controller.scrollType.value
                  ? null
                  : NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    writeCategoryPage(0, controller.contextHeight), //카테고리
                    titlePage(1, controller.contextHeight), //제목
                    destinationPage(2, controller.contextHeight), //목적지
                    calendarPage(3, controller.contextHeight),
                    leadTimeDayPage(4, controller.contextHeight),
                    maximumPeople(5, controller.contextHeight),
                    pricePage(6, controller.contextHeight),
                    contentPage(7, controller.contextHeight)
                  ],
                ),
              ),
            )),
        bottomSheet: bottomFixedSheet());
  }
}
