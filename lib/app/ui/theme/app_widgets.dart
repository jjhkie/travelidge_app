import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/** 정보 불러올 때 확인 */
snapshotCheck(AsyncSnapshot snapshot) {
  if (snapshot.hasData == false) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  if (snapshot.hasError) {
    return Center(child: Text('${snapshot.error}'));
  }

}

/// Icon
Widget iconButtonTheme(
    IconData icon, Color color, double size, VoidCallback func) {
  return IconButton(
      onPressed: func, icon: Icon(icon, color: color, size: size));
}

///Row Icon Button
Widget rowIconButton(String image,String text,VoidCallback func){
  return GestureDetector(
    onTap: func,
    child: Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width:5),
        Text(text)
      ],
    ),
  );
}

/** appbar 제거 */
class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

/** roundBoxGesture*/
Widget roundBoxGesture(String label, Color boxColor, Color borderColor,
    Color textColor, double padding) {
  return Container(
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: borderColor)),
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Text(
        '$label',
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor),
      ));
}

/** roundElevatedButton */
Widget roundElevatedButton(
    String label, Color boxColor, Color borderColor, Color textColor) {
  return Expanded(
      child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      primary: boxColor,
      elevation: 0.0,
    ),
    child: Text('$label'.tr, style: TextStyle(color: textColor)),
    onPressed: () {},
  ));
}
