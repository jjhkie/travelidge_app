
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/home/components/appbar/toggle_button_ui.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';

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
            categoryFunctionButton('상품', 0xFFFFF6CB,0xFFC38100,0),
            SizedBox(width: 4),
            categoryFunctionButton('같이', 0xFFFAE1FF,0xFF9B3AAB,1),
            SizedBox(width: 4),
            categoryFunctionButton('요청', 0xFFD3ECFF,0xFF29B3FF,2),
            SizedBox(width: 12),
            categoryGenreButton('액티비티', 0xFFD3D3D3,0xFF000000,1),
            SizedBox(width: 4),
            categoryGenreButton('이색체험', 0xFFD3D3D3,0xFF000000,2),
            SizedBox(width: 4),
            categoryGenreButton('박물관/전시',0xFFD3D3D3,0xFF000000,3),
            SizedBox(width: 4),
            categoryGenreButton('맛집', 0xFFD3D3D3,0xFF000000,4),
            SizedBox(width: 4),
            categoryGenreButton('맛집', 0xFFD3D3D3,0xFF000000,5),
            SizedBox(width: 4),
            categoryGenreButton('맛집', 0xFFD3D3D3,0xFF000000,6),
            SizedBox(width: 3),
          ],

        ),

      )
    );
  }
}
