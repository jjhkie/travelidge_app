import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/detail/controller/detail_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

final controller = DetailController.to;

functionBox(text, boxColor, textColor) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: boxColor),
    child: Text(text, style: TextStyle(color: textColor)),
  );
}



///bottom content
bottomListItem(int? type) {
  if (type == 0) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('review'.tr),
              TextButton(onPressed: () {}, child: Text('totalPage'.tr))
            ],
          ),
          SizedBox(
            height: 115,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.review.value.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 115,
                  height: 115,
                  child: Container(
                    color: Colors.blue,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(width: 2);
              },
            ),
          ),
        ],
      ),
    );
  } else if (type == 1) {
    return Column(
      children: [
        Text(
            '현재 참여자 ${controller.acceptMember.length}/${controller.board.value.personnel}'),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.acceptMember.length,
            itemBuilder: (context, index) {
              /// 작성자 위젯 생성
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: controller.acceptMember[index].userType == 0
                            ? Border.all(width: 1, color: Palette.black)
                            : null,
                        borderRadius: BorderRadius.circular(20),
                        color: Palette.strongGrey),
                  ),
                  Text('${controller.acceptMember[index].userDto?.userName}')
                ],
              );
            }),
      ],
    );
  } else {
    return Container();
  }
}
