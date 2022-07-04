import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/components/bottom_fixed_sheet.dart';
import 'package:travelidge/app/ui/write/components/category_page.dart';
import 'package:travelidge/app/ui/write/components/write_content_page.dart';
import 'package:travelidge/app/ui/write/components/write_destination_page.dart';
import 'package:travelidge/app/ui/write/components/write_leadtimeday_page.dart';
import 'package:travelidge/app/ui/write/components/write_maximum_people_page.dart';
import 'package:travelidge/app/ui/write/components/write_price_page.dart';
import 'package:travelidge/app/ui/write/components/write_title_page.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

class Writing extends GetView<WriteController> {
  Writing({Key? key}) : super(key: key);

  final dataKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        controller: controller.Sc.value,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryPage(), //카테고리
              SizedBox(key:dataKey),
              titlePage(), //제목
              destinationPage(), //목적지
              leadTimeDayPage(),
              maximumPeople(),
              pricePage(),
              contentPage()
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(

        onPressed: () => Scrollable.ensureVisible(dataKey.currentContext!),
        child: new Text("Scroll to data"),
      ),
    );
    //bottomSheet: bottomFixedSheet());
  }
}
