import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:travelidge/app/ui/pages/upload/controller/upload_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class Upload extends GetView<UploadController> {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: Padding(
            padding: EdgeInsets.all(0),
            child: iconButtonTheme(Icons.close, Palette.black, 20, ()=>Get.back()),
          ),
          title: Text('새 게시물'),
          centerTitle: true,
          actions: [
            Padding(
                padding: EdgeInsets.all(0),
                child: iconButtonTheme(
                    Icons.arrow_forward, Palette.black, 20, ()=> controller.nextPage()))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [imagePreview(), uploadTypeSelect(), imageSelectList()],
          ),
        ));
  }

  Widget imagePreview() {
    return Obx(() => Container(
          width: Get.width,
          height: Get.width,
          color: Colors.grey,
          child: photoWidget(controller.selectedImage.value, Get.width.toInt(),
              builder: (data) {
            return Image.memory(data, fit: BoxFit.cover);
          }),
        ));
  }

  Widget uploadTypeSelect() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("최근 항목"),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: const [
                    Icon(Icons.auto_awesome_motion_outlined, size: 20),
                    SizedBox(width: 7),
                    Text('여러 항목 선택', style: CustomTextStyle.size14)
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Palette.lightGrey, shape: BoxShape.circle),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget imageSelectList() {
    return Obx(() => GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemCount: controller.imageList.length,
        itemBuilder: (context, index) {
          return photoWidget(controller.imageList[index], 200, builder: (data) {
            return GestureDetector(
              onTap: () =>
                  controller.changeSelectedImage(controller.imageList[index]),
              child: Obx(() => Opacity(
                    opacity: controller.imageList[index] ==
                            controller.selectedImage.value
                        ? 0.3
                        : 1,
                    child: Image.memory(data, fit: BoxFit.cover),
                  )),
            );
          });
        }));
  }

  Widget photoWidget(AssetEntity asset, int size,
      {required Widget Function(Uint8List) builder}) {
    return FutureBuilder(
        future: asset.thumbnailDataWithSize(ThumbnailSize(size, size)),
        builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return builder(snapshot.data!);
          } else {
            return Container();
          }
        });
  }
}
