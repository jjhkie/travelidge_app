//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travelidge/controller/infinite_scroll_controller.dart';
//
//
//
// Widget refresh(){
//   return Container(
//     padding: const EdgeInsets.all(10.0),
//     child: Center(
//       child: Column(
//         children: [
//           Text('데이터의 마지막 입니다'),
//           IconButton(
//             onPressed: () {
//               Get.find<InfiniteScrollController>().reload();
//             },
//             icon: Icon(Icons.refresh_outlined),
//           ),
//         ],
//       ),
//     ),
//   );
// }