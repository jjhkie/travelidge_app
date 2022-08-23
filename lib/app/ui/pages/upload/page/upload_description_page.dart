import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/upload/controller/upload_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class uploadDescriptionPage extends GetView<UploadController> {
  Widget get line => const Divider(color: Palette.lightGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: iconButtonTheme(
            Icons.arrow_back, Palette.black, 20, () => Get.back()),
        title: Text("새 게시물"),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: ()=> controller.uploadPost(),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('등록'),
              ))
        ],
      ),
      body: GestureDetector(
        onTap: ()=>controller.unfocusKeyboard(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              desImage(),
              line,
              desContent(),
              line,
              desTag(),
              line,
              desDisclosure()
            ],
          ),
        ),
      ),
    );
  }

  Widget desImage() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.file(
                controller.file!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget desContent() {
    return Container(
      child: TextField(
        controller: controller.textEditingController,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: "내용을 작성하세요"),
        maxLines: 7,
      ),
    );
  }

  Widget desTag() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("링크 태그"),
            Text(">", style: CustomTextStyle.size14LightGreyFont),
          ],
        ),
      ),
    );
  }

  Widget desDisclosure() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("공개 범위"),
            Text("전체공개", style: CustomTextStyle.size14LightGreyFont),
          ],
        ),
      ),
    );
  }
}
