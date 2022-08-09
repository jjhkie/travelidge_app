import 'package:flutter/material.dart';
import 'package:travelidge/app/ui/pages/detail/controller/detail_controller.dart';

final controller = DetailController.to;

functionBox(text, boxColor, textColor) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: boxColor),
    child: Text(text, style: TextStyle(color: textColor)),
  );
}

bottomListItem(int? type) {
  if (type == 0) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('관련된 후기'),
              TextButton(onPressed: () {}, child: Text('전체보기'))
            ],
          ),
          Container(
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
    return Container(
      child: Column(
        children: [
          Text('현재 참여자 ${controller.acceptMember.value.length}/${controller.board.value.personnel}'),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.acceptMember.value.length,
              itemBuilder: (context, index) {
                /** 작성자 위젯 생성 */
                return Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: controller.acceptMember[index].userType ==0?Border.all(width:1,color: Colors.black):null,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      ),
                      Text('${controller.acceptMember[index].userDto?.userName}')
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  } else {
    return Container();
  }
}
