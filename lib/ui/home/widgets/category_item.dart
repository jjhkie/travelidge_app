import 'package:flutter/material.dart';
import 'package:travelidge/ui/home/widgets/home_common.dart';

Widget categoryList(data) {
  return Column(
    children: <Widget>[
      listTitle('카테고리별 여행'),
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
