import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/home/components/toggle_button_ui.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';


class SliverHeaderData extends StatelessWidget {

  final controller = HomeController.to;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      /** Logo & Icon */
      _mainAppbar(),
      const SizedBox(height: 30),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'appBarTitle'.tr,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          /** location ui  & calendar ui */
          children: [
            _locationBox(),
            const SizedBox(width: 10),
            _calendarBox(),
          ],
        ),
      ),

      /** 첫 번째 라인 Toggle Button*/
      const SizedBox(height: 27),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            categoryFunctionButton('ContentFun_1'.tr, Palette.lightYellow, Palette.strongYellow, 0),
            const SizedBox(width: 10),
            categoryFunctionButton('ContentFun_2'.tr, Palette.lightPurple, Palette.strongPurple, 1),
            const SizedBox(width: 10),
            categoryFunctionButton('ContentFun_3'.tr, Palette.lightBlue, Palette.strongBlue, 2)
          ],
        ),
      ),

      /** 두 번째 라인 Toggle Button*/
      const SizedBox(height: 7),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SizedBox(
          height: 35,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              allGenreButton('ContentGen'.tr, Palette.lightGrey, Palette.black),
              const SizedBox(width: 10),
              categoryGenreButton('ContentGen_1'.tr, Palette.lightGrey, Palette.black, 0),
              const SizedBox(width: 10),
              categoryGenreButton('ContentGen_2'.tr, Palette.lightGrey, Palette.black, 1),
              const SizedBox(width: 10),
              categoryGenreButton('ContentGen_3'.tr, Palette.lightGrey, Palette.black, 2),
              const SizedBox(width: 10),
              categoryGenreButton('ContentGen_4'.tr, Palette.lightGrey, Palette.black, 3),
              const SizedBox(width: 10),
              categoryGenreButton('ContentGen_5'.tr, Palette.lightGrey, Palette.black, 4),
              const SizedBox(width: 10),
              categoryGenreButton('ContentGen_6'.tr, Palette.lightGrey, Palette.black, 5),
              const SizedBox(width: 10)
            ],
          ),
        ),
      ),
    ]);
  }

  /** location page & bottomSheet*/
  Widget _locationBox() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
      child: GestureDetector(
        onTap: () {
          controller.BottomSheet('location');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.grey.withOpacity(0.7),
                )),
            Expanded(
                flex: 4, child: Obx(() =>Text(controller.bottomSheetLo.value, style: TextStyle(fontSize: 18))))
          ]),
        ),
      ),
    ));
  }

  /** Calendar page & bottomSheet*/
  Widget _calendarBox() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
      child: GestureDetector(
        onTap: () {
          controller.BottomSheet('calendar');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: Colors.grey.withOpacity(0.7),
                  )),
              Expanded(
                  flex: 4, child: Text('calendar'.tr, style: TextStyle(fontSize: 18)))
            ],
          ),
        ),
      ),
    ));
  }
}

/** Logo & Icon */
Widget _mainAppbar() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('logo'.tr, style: TextStyle(color: Palette.black, fontSize: 20)),
        Row(
          children: const [
            Icon(Icons.search, color: Palette.black),
            SizedBox(width: 20),
            Icon(Icons.notifications_none, color: Palette.black)
          ],
        )
      ],
    ),
  );
}
