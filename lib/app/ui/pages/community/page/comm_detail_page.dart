import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/controller/community_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class CommDetail extends GetView<CommunityController> {
  const CommDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Palette.white,
            leading: iconButtonTheme(Icons.arrow_back_ios, Palette.black, 25,
                () => controller.backPage()),
            actions: [
              iconButtonTheme(
                  Icons.file_download_outlined, Palette.black, 21, () {}),
              iconButtonTheme(Icons.more_vert, Palette.black, 21, () {}),
            ],
          ),
          body: SafeArea(
            child:SingleChildScrollView(
              child:Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('카테고리', style: CustomTextStyle.size14),
                        SizedBox(height: 20),
                        Text('Title', style: CustomTextStyle.size24),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('작성자', style: CustomTextStyle.size14),
                            SizedBox(width: 20),
                            Text('작성 시간', style: CustomTextStyle.size14),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          'content\n내용입니다. 보통 쉬실 때 뭐 하시는지? 궁금 이게 짧을 글일 때는 문제가 안됨 긴 글일 때 이제 문제가 시작되는 건데. 얘 행간이 왜 안 늘어나니 이상한데 늘리고 있었음 얼마나 길어야 하나? ',
                          style: CustomTextStyle.size16SpacingHalfHeight,
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: Get.width,
                          height: Get.width / 2,
                          decoration: BoxDecoration(
                            color: Palette.strongGrey,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text('댓글 3'),
                        SizedBox(height: 40),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                            itemBuilder: (context,index){
                          return ListTile(
                            leading: Text('작성자'),
                            title:Text('content'),
                            subtitle: Text('답글'),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          );
                        }),
                        SizedBox(height: 100)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      bottomSheet: SizedBox(
        width:Get.width,
        height: 90,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: CustomTextStyle.size12,
              decoration: InputDecoration(
                suffixIcon: Text('작성'),
                border: OutlineInputBorder()
              ),
            ),
          ),
        ),
      ),),
    );
  }
}
