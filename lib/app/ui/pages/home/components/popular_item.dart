import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/routes/app_routes.dart';

Widget popularList(data) {
  return Column(
    children: <Widget>[
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: data!.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAIL),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(8.0))),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                    child: Image.network(
                      '${data![index].thumbnailUrl}',
                      width: 100,
                      height: 130,
                      fit: BoxFit.cover,
                      errorBuilder: (context, url, error) => Container(
                        child: Image.network(
                            'http://www.gapyeongnow.kr/news/photo/201406/5584_5678_3211.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(height: 130,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${data[index].preTitle}'),
                            Text('${data[index].postTitle}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Stack(
                  //     children: [
                  //       backgroundImage(data, index),
                  //       Container(
                  //         child: Column(
                  //           children: [
                  //             Text('${data[index].preTitle}'),
                  //             Text('${data[index].postTitle}'),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(width: 10)
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, color: Colors.white),
      )
    ],
  );
}
