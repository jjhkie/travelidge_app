import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/provider/api.dart';
import 'package:travelidge/data/repository/home_repository.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';

final controller = Get.put(HomeController(HomeRepository(ApiClient())));

FunctionButton(title, color, textColor, int index) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1.0,
              color: controller.selection_1[index].value
                  ? Color(color)
                  : Color(0xFFD3D3D3)),
          color: controller.selection_1[index].value
              ? Color(color)
              : Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '$title',
          style: TextStyle(
              color: controller.selection_1[index].value
                  ? Color(textColor)
                  : const Color(0xFFD3D3D3),
              fontSize: 16,
              fontWeight: controller.selection_1[index].value
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
                color: controller.sectionAll.value?Color(color):controller.selection_2[index].value?Color(color):Color(0xFFD3D3D3)),
            color: controller.sectionAll.value?Color(color):controller.selection_2[index].value?Color(color):Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$title',
            style: TextStyle(
                color:
                controller.sectionAll.value?Color(textColor):controller.selection_2[index].value?Color(textColor):Color(0xFFD3D3D3),
                fontSize: 16,
                fontWeight: controller.selection_2[index].value
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
                color: controller.selection_2[index].value?Color(color):Color(0xFFD3D3D3)),
            color: controller.selection_2[index].value?Color(color):Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$title',
            style: TextStyle(
                color: controller.selection_2[index].value?Color(textColor):Color(0xFFD3D3D3),
                fontSize: 16,
                fontWeight: controller.selection_2[index].value
                    ? FontWeight.w600
                    : FontWeight.normal),
          ),
        )),
  );
}

Widget hideFunctionButton(title, color, textColor, int index) {
  return Offstage(
    offstage: controller.selection_1[index].value ? false : true,
    child: FunctionButton(title, color, textColor, index),
  );
}

Widget hideGenreButton(title, color, textColor, int index) {
  return Offstage(
    offstage: controller.sectionAll.value
        ? false
        : controller.selection_2[index].value
            ? false
            : true,
    child: listGenreButton(title, color, textColor, index),
  );
}

Widget categoryFunctionButton(title, color, textColor, int index) {
  return InkWell(
      onTap: () => controller.functionToggleChange(index),
      child: Obx(() => FunctionButton(title, color, textColor, index)));
}

Widget categoryGenreButton(title, color, textColor, int index) {
  return InkWell(
    onTap: () => controller.genreToggleChange(index),
    child: Obx(() => GenreButton(title, color, textColor, index)),
  );
}

Widget allGenreButton(title, color, textColor) {
  return InkWell(
    onTap: () => controller.allToggleButton(),
    child: Obx(() => Center(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1.0,
                      color: controller.sectionAll.value
                          ? Color(color)
                          : Color(0xFFD3D3D3)),
                  color: controller.sectionAll.value
                      ? Color(color)
                      : Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '$title',
                  style: TextStyle(
                      color: controller.sectionAll.value
                          ? Color(textColor)
                          : const Color(0xFFD3D3D3),
                      fontSize: 16,
                      fontWeight: controller.sectionAll.value
                          ? FontWeight.w600
                          : FontWeight.normal),
                ),
              )),
        )),
  );
}
