
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/controller/community_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class CommWrite extends GetView<CommunityController>{
  const CommWrite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: iconButtonTheme(Icons.arrow_back_ios, Palette.black, 25, ()=> controller.backPage()),
        backgroundColor: Palette.white,
        actions: [
          GestureDetector(
            onTap:(){},
            child: Text('등록',style:CustomTextStyle.size16BlackFont),
          )
        ],
      ),
      body: Container(
          child:Text("글작성페이지")
      ),
    );
  }

}