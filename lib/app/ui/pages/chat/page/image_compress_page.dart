import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/chat/controller/compress_controller.dart';

class imageCompressPage extends GetView<CompressController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Image Compress'),
      ),
      body: Center(
        child: Obx(()=>Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (controller.imageFiles.isNotEmpty)
              SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: controller.imageFiles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('Before'),
                            Image.file(
                              controller.imageFiles[i]!,
                              height: 100,
                              width: 100,
                            ),
                            Text(
                                '${(controller.imageFiles[i]!.lengthSync() / 1024).round()} kb'),
                            const Divider(),
                            if (controller.compressedFiles.isNotEmpty)
                              Column(
                                children: [
                                  const Text('After'),
                                  Image.file(
                                    controller.compressedFiles[i]!,
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                      '${(controller.compressedFiles[i]!.lengthSync() / 1024).round()} kb'),
                                  const Divider(),
                                ],
                              )
                          ],
                        ),
                      );
                    }),
              ),
            const Divider(),
            ElevatedButton(
              onPressed: () => controller.pickImage(),
              child: const Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: () => controller.compress(),
              child: const Text('Compress'),
            )
          ],
        )),
      ),
    );
  }
}