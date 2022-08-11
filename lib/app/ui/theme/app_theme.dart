import 'package:flutter/material.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'AppleSDGothicNeo',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
  ),
);


class CustomTextStyle{

  static const TextStyle size14LightGreyFont = TextStyle(  fontSize: 14,
      color: Palette.lightGrey);

  static const TextStyle size14WhiteFont = TextStyle(  fontSize: 14,
      color: Palette.white);

  static const TextStyle size16Font = TextStyle(  fontSize: 16);
  static const TextStyle size16GreyFont = TextStyle(  fontSize: 16,color:Palette.strongGrey);



  static const TextStyle size24Font = TextStyle(  fontSize: 24);

}