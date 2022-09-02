
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelidge/app/ui/pages/community/page/comm_detail_page.dart';
import 'package:travelidge/app/ui/pages/community/page/comm_my_page.dart';
import 'package:travelidge/app/ui/pages/community/page/comm_write_page.dart';

class CommunityController extends GetxController with SingleGetTickerProviderMixin{

  static CommunityController get to => Get.find<CommunityController>();
  late TabController tabController;
  late TabController myTabController;

  final categoryList = ["travel".tr,"love".tr,"postscript".tr,"free".tr];
  RxString selectedValue = 'category_register_text'.tr.obs;

  ///imagePicker
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    myTabController = TabController(length: 2, vsync: this);
  }

  Future getImage() async{
    XFile? image = await picker.pickImage(
        source:ImageSource.gallery,
    maxHeight: 100,
    maxWidth: 100,
    imageQuality: 100);
    selectedImage = image;
  }

  backPage(){
    Get.back();
  }

  getDetailMove(){
    Get.to(() => CommDetail());
  }

  myPageMove(){
    Get.to(() => CommMy());
  }

  writePageMove(){
    Get.to(() => CommWrite());
  }
}