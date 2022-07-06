import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';

import 'package:travelidge/app/ui/theme/app_colors.dart';

FunctionButton(title, color, textColor, int index) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1.0,
              color: HomeController.to.selection_1[index].value
                  ? color
                  : Palette.lightGrey),
          color: HomeController.to.selection_1[index].value
              ? color
              : Palette.white),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '$title',
          style: TextStyle(
              color: HomeController.to.selection_1[index].value
                  ? textColor
                  : Palette.lightGrey,
              fontSize: 16,
              fontWeight: HomeController.to.selection_1[index].value
                  ? FontWeight.w600
                  : FontWeight.normal),
        ),
      ));
}

listGenreButton(title, color, textColor, int index) {
  return Center(
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1.0,
                color: HomeController.to.sectionAll.value
                    ? color
                    : HomeController.to.selection_2[index].value
                        ? color
                        : Palette.lightGrey),
            color: HomeController.to.sectionAll.value
                ? color
                : HomeController.to.selection_2[index].value
                    ? color
                    : Palette.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$title',
            style: TextStyle(
                color: HomeController.to.sectionAll.value
                    ? textColor
                    : HomeController.to.selection_2[index].value
                        ? textColor
                        : Palette.lightGrey,
                fontSize: 16,
                fontWeight: HomeController.to.selection_2[index].value
                    ? FontWeight.w600
                    : FontWeight.normal),
          ),
        )),
  );
}

GenreButton(title, color, textColor, int index) {
  return Center(
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1.0,
                color: HomeController.to.selection_2[index].value
                    ? color
                    : Palette.lightGrey),
            color: HomeController.to.selection_2[index].value
                ? color
                : Palette.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$title',
            style: TextStyle(
                color: HomeController.to.selection_2[index].value
                    ? textColor
                    : Palette.lightGrey,
                fontSize: 16,
                fontWeight: HomeController.to.selection_2[index].value
                    ? FontWeight.w600
                    : FontWeight.normal),
          ),
        )),
  );
}

Widget hideFunctionButton(title, color, textColor, int index) {
  return Offstage(
    offstage: HomeController.to.selection_1[index].value ? false : true,
    child: FunctionButton(title, color, textColor, index),
  );
}

Widget hideGenreButton(title, color, textColor, int index) {
  return Offstage(
    offstage: HomeController.to.sectionAll.value
        ? false
        : HomeController.to.selection_2[index].value
            ? false
            : true,
    child: listGenreButton(title, color, textColor, index),
  );
}

Widget categoryFunctionButton(title, Color color, Color textColor, int index) {
  return InkWell(
      onTap: () => HomeController.to.functionToggleChange(index),
      child: Obx(() => FunctionButton(title, color, textColor, index)));
}

Widget categoryGenreButton(title, color, textColor, int index) {
  return InkWell(
    onTap: () => HomeController.to.genreToggleChange(index),
    child: Obx(() => GenreButton(title, color, textColor, index)),
  );
}

Widget allGenreButton(title, color, textColor) {
  return InkWell(
    onTap: () => HomeController.to.allToggleButton(),
    child: Obx(() => Center(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1.0,
                      color: HomeController.to.sectionAll.value
                          ? color
                          : Palette.lightGrey),
                  color: HomeController.to.sectionAll.value
                      ? color
                      : Palette.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '$title',
                  style: TextStyle(
                      color: HomeController.to.sectionAll.value
                          ? textColor
                          : Palette.lightGrey,
                      fontSize: 16,
                      fontWeight: HomeController.to.sectionAll.value
                          ? FontWeight.w600
                          : FontWeight.normal),
                ),
              )),
        )),
  );
}
