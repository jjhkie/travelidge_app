import 'package:flutter/material.dart';
import 'package:travelidge/screens/home/common/home_common.dart';

Widget friendList(data) {
  return Column(
    children: <Widget>[
      listTitle('친구한 로컬민'),
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
                              Text('${data[index].travelDto.title}'),
                              Text(
                                  '${data[index].travelDto.partyCount} / ${data[index].travelDto.partyMaxCount}'),
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

