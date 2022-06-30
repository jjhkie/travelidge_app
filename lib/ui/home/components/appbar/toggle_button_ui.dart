import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/data/provider/api.dart';
import 'package:travelidge/data/repository/home_repository.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';

final c = Get.put(HomeController(HomeRepository(ApiClient())));

FunctionButton(title, color, textColor, int index) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1.0,
              color: c.selection_1[index].value
                  ? Color(color)
                  : Color(0xFFD3D3D3)),
          color: c.selection_1[index].value
              ? Color(color)
              : Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '$title',
          style: TextStyle(
              color: c.selection_1[index].value
                  ? Color(textColor)
                  : const Color(0xFFD3D3D3),
              fontSize: 16,
              fontWeight: c.selection_1[index].value
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
                color: c.sectionAll.value?Color(color):c.selection_2[index].value?Color(color):Color(0xFFD3D3D3)),
            color: c.sectionAll.value?Color(color):c.selection_2[index].value?Color(color):Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$title',
            style: TextStyle(
                color:
                c.sectionAll.value?Color(textColor):c.selection_2[index].value?Color(textColor):Color(0xFFD3D3D3),
                fontSize: 16,
                fontWeight: c.selection_2[index].value
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
                color: c.selection_2[index].value?Color(color):Color(0xFFD3D3D3)),
            color: c.selection_2[index].value?Color(color):Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$title',
            style: TextStyle(
                color: c.selection_2[index].value?Color(textColor):Color(0xFFD3D3D3),
                fontSize: 16,
                fontWeight: c.selection_2[index].value
                    ? FontWeight.w600
                    : FontWeight.normal),
          ),
        )),
  );
}

Widget hideFunctionButton(title, color, textColor, int index) {
  return Offstage(
    offstage: c.selection_1[index].value ? false : true,
    child: FunctionButton(title, color, textColor, index),
  );
}

Widget hideGenreButton(title, color, textColor, int index) {
  return Offstage(
    offstage: c.sectionAll.value
        ? false
        : c.selection_2[index].value
            ? false
            : true,
    child: listGenreButton(title, color, textColor, index),
  );
}

Widget categoryFunctionButton(title, color, textColor, int index) {
  return InkWell(
      onTap: () => c.functionToggleChange(index),
      child: Obx(() => FunctionButton(title, color, textColor, index)));
}

Widget categoryGenreButton(title, color, textColor, int index) {
  return InkWell(
    onTap: () => c.genreToggleChange(index),
    child: Obx(() => GenreButton(title, color, textColor, index)),
  );
}

Widget allGenreButton(title, color, textColor) {
  return InkWell(
    onTap: () => c.allToggleButton(),
    child: Obx(() => Center(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1.0,
                      color: c.sectionAll.value
                          ? Color(color)
                          : Color(0xFFD3D3D3)),
                  color: c.sectionAll.value
                      ? Color(color)
                      : Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '$title',
                  style: TextStyle(
                      color: c.sectionAll.value
                          ? Color(textColor)
                          : const Color(0xFFD3D3D3),
                      fontSize: 16,
                      fontWeight: c.sectionAll.value
                          ? FontWeight.w600
                          : FontWeight.normal),
                ),
              )),
        )),
  );
}
