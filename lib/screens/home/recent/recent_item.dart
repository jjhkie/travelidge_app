import 'package:flutter/material.dart';
import 'package:travelidge/screens/home/common/home_common.dart';

Widget recentList(data) {
  return Column(
    children: <Widget>[
      listTitle('최근 등록된 여행'),
      SizedBox(height: 2),
      Container(
        height: 200,
        child: ListView.builder(
          itemCount: data!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Container(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      children: [
                        backgroundImage(data, index),
                        Container(
                          child: Column(
                            children: [
                              Text('${data[index].title}'),
                              Text('${data[index].type}'),
                              Text(
                                  '${data[index].partyCount} / ${data[index].partyMaxCount}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10)
                ],
              ),
            );
          },
        ),
      )
    ],
  );
}
