
import 'package:flutter/material.dart';

/**Bottom 고정 화면 */
Widget bottomFixedSheet(size) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
              color: Color(0xff9E9E9E),
              width: 1.0,
            ))),
    child: Padding(
      padding: EdgeInsets.only(
          top: (size * 0.02), left: 20, right: 20, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Text('미리보기', textAlign: TextAlign.center)),
          ),
          SizedBox(width: 4),
          Expanded(
            flex: 3,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5, color: Colors.grey),
                    color: Color(0xffc4c4c4)),
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Text('등록하기', textAlign: TextAlign.center)),
          ),
        ],
      ),
    ),
  );
}