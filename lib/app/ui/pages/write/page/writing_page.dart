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
            )),
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                onVerticalDragUpdate: (detail){controller.effectiveFunc('scroll');},
                child: Stack(children: [
                  Obx(()=> AbsorbPointer(
                    absorbing: controller.scrollType.value?true:false,
                    child: SingleChildScrollView(
                        controller: controller.scrollController.value,
                        physics:controller.scrollType.value?ClampingScrollPhysics():controller.effectiveCheck.value?ClampingScrollPhysics():NeverScrollableScrollPhysics(),
                        child: Column(children: [
                              writeCategoryPage(0),
                              titlePage(1),
                              destinationPage(2),
                              calendarPage(3),
                              leadTimeDayPage(4),
                              maximumPeople(5),
                              pricePage(6),
                              contentPage(7),
                            ])),
                  )),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Obx(() => Offstage(
                        offstage: controller.scrollTap.value.contains(true)?false:true,
                        child: GestureDetector(
                          onTap: ()=> controller.effectiveFunc('topTouch'),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: controller.paddingHalfValue.value,
                              child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                    Colors.white,
                                    Colors.white60.withOpacity(0.1)
                                  ])))),
                        ),
                      ))),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 3,
                            child:Obx(()=>LinearProgressIndicator(

                              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                              value: (controller.writeComplete.lastIndexOf(true)+1)/(controller.maxCounter+1),
                            )),
                          )),

                ]))),
        bottomSheet:bottomFixedSheet()
    );
  }
}
