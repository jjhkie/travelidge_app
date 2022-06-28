import 'package:flutter/material.dart';
import 'package:travelidge/ui/home/components/home_common.dart';

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
                              Text('${data[index].travelList.title}'),
                              Text(
                                  '${data[index].travelList.partyCount} / ${data[index].travelList.partyMaxCount}'),
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

