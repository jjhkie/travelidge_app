import 'package:flutter/material.dart';
import 'package:travelidge/app/ui/pages/nav/controller/nav_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

final controller = NavController.to;

/** BottomNavigationbar Middle Button */
Widget writeButton(String iconData, String text, int index) => Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Palette.mainColor),
        child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(iconData),
                Text(text,
                    style: const TextStyle(fontSize: 12, color: Palette.black))
              ],
            ),
            onTap: () => controller.changePageIndex(index)),
      ),
    );
