import 'package:flutter/material.dart';

//리스트 제목
Widget listTitle(title){
  return Align(
    alignment: Alignment.centerLeft,
    child: ElevatedButton(onPressed: () {}, child: Text('$title')),
  );
}



//이미지 로딩
Widget backgroundImage(data, index) {
  return Container(
    child: Image.network(
      '${data![index].thumbnailUrl}',
      errorBuilder: (context, url, error) => Container(
        child: Image.network(
            'http://www.gapyeongnow.kr/news/photo/201406/5584_5678_3211.jpg'),
      ),
    ),
  );
}
