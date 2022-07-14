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
    var controller = WriteController.to;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => controller.prevPage(),
        ),
      ),
      // body: SafeArea(
      //     child: Obx(
      //   () => SingleChildScrollView(
      //     controller: controller.autoController,
      //     // physics: controller.scrollType.value
      //     //     ? null
      //     //     : NeverScrollableScrollPhysics(),
      //     scrollDirection: Axis.vertical,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //
      //         writeCategoryPage(0, controller.contextHeight),
      //         titlePage(1, controller.contextHeight),
      //         destinationPage(2, controller.contextHeight),
      //         calendarPage(3, controller.contextHeight),
      //         leadTimeDayPage(4, controller.contextHeight),
      //         maximumPeople(5, controller.contextHeight),
      //         pricePage(6, controller.contextHeight),
      //         contentPage(7, controller.contextHeight),
      //         bottomFixedSheet()
      //       ],
      //     ),
      //   ),
      // )),
      body: SafeArea(
        child: Stack(
          children: [
            /** main scroll */
            SingleChildScrollView(
              controller: controller.scrollController.value,
              child: Obx(() => Column(
                    children: [
                      writeCategoryPage(0),
                      titlePage(1),
                      destinationPage(2),
                      calendarPage(3),
                      leadTimeDayPage(4),
                      maximumPeople(5),
                      pricePage(6),
                      contentPage(7),
                      /** bottomSheet*/
                      bottomFixedSheet(),
                    ],
                  )),
            ),

            /** opacity gradient 상단바*/
            Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  width: controller.width,
                  height: 70,
                  child: Container(decoration:BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white,Colors.white60.withOpacity(0.1)]
                      )
                  )),
                )),
          ],
        ),
      ),
      //bottomSheet: bottomFixedSheet()
    );
  }
}
