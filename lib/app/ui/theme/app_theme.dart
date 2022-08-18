import 'package:flutter/material.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'AppleSDGothicNeo',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
  ),
);

<<<<<<< Updated upstream

class CustomTextStyle{

  static const TextStyle size14LightGreyFont = TextStyle(  fontSize: 14,
      color: Palette.lightGrey);

  static const TextStyle size14WhiteFont = TextStyle(  fontSize: 14,
      color: Palette.white);

  static const TextStyle size16Font = TextStyle(  fontSize: 16);
  static const TextStyle size16GreyFont = TextStyle(  fontSize: 16,color:Palette.strongGrey);



  static const TextStyle size24Font = TextStyle(  fontSize: 24);

}
=======
class CustomTextStyle {
  static const TextStyle size12 = TextStyle(fontSize: 12);
  static const TextStyle size14 = TextStyle(fontSize: 14);
  static const TextStyle size16 = TextStyle(fontSize: 16);
  static const TextStyle size24 = TextStyle(fontSize: 24);

  ///12
  static const TextStyle size12GreyFont =
      TextStyle(fontSize: 12, color: Palette.grey);

  ///14
  static const TextStyle size14LightGreyFont =
      TextStyle(fontSize: 14, color: Palette.lightGrey);
  static const TextStyle size14WhiteFont =
      TextStyle(fontSize: 14, color: Palette.white);

  ///16
  static const TextStyle size16GreyFont =
      TextStyle(fontSize: 16, color: Palette.strongGrey);
  static const TextStyle size16BlackFont =
      TextStyle(fontSize: 16, color: Palette.black);
  static const TextStyle size16SpacingHalfHeight =
  TextStyle(fontSize: 16, letterSpacing: 0.5,height: 1.5);
}
>>>>>>> Stashed changes
