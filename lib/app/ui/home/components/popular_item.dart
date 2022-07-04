import 'package:flutter/material.dart';
import 'package:travelidge/app/ui/home/components/home_common.dart';


Widget popularList(data) {
  return Column(
    children: <Widget>[
      listTitle('지금 인기 지역'),
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
                              Text('${data[index].preTitle}'),
                              Text('${data[index].postTitle}'),
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
