// import 'package:flutter/material.dart';
// import 'package:flutter/src/components/framework.dart';
// import 'package:get/get.dart';
// import 'package:travelidge/ui/declare/controller/declare_controller.dart';
//
// class ToggleButton extends GetView<DeclareController> {
//   List<bool> isSelected = List.generate(6, (_) => false);
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//         children: <Widget>[
//     //TODO wrap쓰시고, 각 item별로 클릭 함수 추가로 만들어주자
//           ToggleBt('음식'),
//           ToggleBt('액티비티/스포츠'),
//           ToggleBt('자연/휴식'),
//           ToggleBt('문화,공연'),
//           ToggleBt('야경'),
//           ToggleBt('교통')
//         ],
//     );
//   }
// }
//
// Widget ToggleBt(title) {
//   return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16), child: Text('$title'));
// }
