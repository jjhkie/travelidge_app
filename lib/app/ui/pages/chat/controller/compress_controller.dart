import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CompressController extends GetxController {
  final _picker = ImagePicker().obs;
  // final List<File?> imageFiles = [];
  // final List<File?> compressedFiles = [];

  final imageFiles = <File?>[].obs;
  final compressedFiles = <File?>[].obs;
  RxBool com = false.obs;

  Future<void> compress() async {
    for (var imageFile in imageFiles) {
      print('imageFile $imageFile');
      print('imageFiles $imageFiles');
      var result = await FlutterImageCompress.compressAndGetFile(
        imageFile!.absolute.path,
        imageFile.path + 'compressed.jpg',
        quality: 50,
      );
      compressedFiles.add(result);
      com.value = true;
      print('compressedFiles $compressedFiles');
    }
  }

  Future<void> pickImage() async {
    imageFiles.clear();
    compressedFiles.clear();
    final images = await _picker.value.pickMultiImage();

    for (int i = 0; i < images!.length; i++) {
      imageFiles.add(File(images[i].path));
    }
  }
}
