import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

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
Widget roundBoxGesture(String label,Color boxColor,Color borderColor,Color textColor,double padding){
    return Container(
        decoration: BoxDecoration(
          color: boxColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 0.5, color: borderColor)),
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Text('$label', textAlign: TextAlign.center,style: TextStyle(color:textColor),));

}

/** roundElevatedButton */
Widget roundElevatedButton(String label,Color boxColor,Color borderColor,Color textColor){
  return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          primary: boxColor,
          elevation: 0.0,
        ),
        child: Text('$label'.tr,
            style: TextStyle(color: textColor)),
        onPressed: () {},
      ));
}

