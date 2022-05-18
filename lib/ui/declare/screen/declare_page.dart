import 'package:flutter/material.dart';
import 'package:travelidge/ui/declare/components/category_toggle_button.dart';
import 'package:travelidge/ui/declare/components/dropdown_button.dart';
import 'package:travelidge/ui/declare/components/title_textfield.dart';

class declare extends StatelessWidget {
  const declare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text('여행등록'),
            SizedBox(height: 20),
            Center(
              child: Row(
                children: [
                  Text('분류'),
                  SizedBox(
                    width: 20,
                  ),
                  DropDownButtonWidget()
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text('제목'),
                SizedBox(width: 20),
                TitleTextfield()
              ],
            ),
            SizedBox(height: 20),
            /**사진 업로드 기능 추가**/

            /**여행 내용 및 해시태그 **/
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Expanded(
                child: Column(
                  children: [
                    TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '여행내용'),
                        maxLines: 5),
                    TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '해시태그'),
                        maxLines: 2)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            /**카테고리**/
            Column(
              children: [
                Text('목록'),
                SizedBox(height: 10),
                ToggleButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
